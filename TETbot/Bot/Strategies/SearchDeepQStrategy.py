from random import randint

from .AbstractStrategy import AbstractStrategy
from .DeepQ import DeepQ
from ..Game.Game import Game
from .Tree.TETTree import TETTree
import numpy as np
from ..Game.Piece import *

import multiprocessing
from copy import deepcopy
import sys
import time



def get_piece(id):
    if id == 10:
        return LPiece()
    if id == 40:
        return OPiece()
    if id == 70:
        return IPiece()
    if id == 100:
        return JPiece()
    if id == 130:
        return SPiece()
    if id == 160:
        return TPiece()
    if id == 190:
        return ZPiece()


# using a neural network is as good as using a random agent as
# the number of states is huge
# I thought to use heuristics to train a neural network and help it converge
# As it gains expertise it may aid the heuristic component by lowering the branching
# factor relying on the neural net to choose the top k
def deep_q_search(child_conn, move_set, enc, rew, id):
    branching_factor = 75
    branches = 81 # total number of actions
    
    game = None
    if child_conn.poll(10):
        game = child_conn.recv()
    
    
    # game = Game()
    # game.piece = get_piece(piece)
    # game.nextPiece = get_piece(piecen)
    lines = TETTree((game.piece._id, 0), (game, 0))
    queue = [(lines.root, game.get_pieces())]
    
    
    with open('botasdf-'+id+'.txt', 'w') as out:
        out.write('move: '+ str(game) + '\n')
    
    state_size = enc.get_state_size(game)
    deep_Q = DeepQ(state_size, branches, id=id)
    
    first = True
    
    while True:
        
        #with open('botasdf-'+id+'.txt', 'a') as out:
            #out.write('itr: '+ str(len(queue)) + ', ' + str(len(lines.root.children)) + '\n')
        # BFS the states while waiting
        if len(queue) == 0: continue
        cur_node = queue[0][0]
        piece = queue[0][1][0]
        if len(queue[0][1]) == 1:
            queue = queue[1:]
        else:
            queue[0] = (queue[0][0], queue[0][1][1:])
        cur_game = deepcopy(cur_node.value[0])
        cur_game.piece = piece
        state = enc.get_state(cur_game)
        for viable in deep_Q.choosek(branching_factor, state):
            line = cur_game.simulate_game(move_set[viable[0]])
            if line is None: continue
            reward = rew.get_reward(line)
            deep_Q.learn(state, viable[0], enc.get_state(line), reward)
            new_node = cur_node.create_child((piece._id, viable[0]), (line, reward), parent=cur_node)
            new_node.bubble_up(reward)
            queue.append((new_node, line.get_pieces()))
            
            
        if child_conn.poll() or first:
            if first:
                first = False
            else:
                game = child_conn.recv()    # Read from the output pipe
            
                if game.won == 1:
                    deep_Q.win()
                    break
                elif game.won == 0:
                    deep_Q.lost()
                    break
                    
            piecenext = game.nextPiece._id
            lines.filter_for_next_piece(piecenext)
            move = lines.max_move()
            child_conn.send(move)
            with open('botasdf-'+id+'.txt', 'a') as out:
                out.write('move: '+ str(move) + '\n')
            
            lines = TETTree((piece, 0), (game, 0))
            queue = [(lines.root, game.get_pieces())]
            
    child_conn.close()
    
    

class SearchDeepQStrategy(AbstractStrategy):
    def __init__(self, game, encoder, rewarder):
        AbstractStrategy.__init__(self, game, encoder, rewarder)
        # the method is integral to the encoder
        # nn could do topheights, but topheights is better on sa
        if encoder == 'flat':
            method = 'lnn'
        elif encoder == 'topheights':
            method = 'sa'
        elif encoder == 'flatplus':
            method = 'lnn'
        self.move_set = self.build_action_list()
        
        self.first_turn = True
        
        enc = deepcopy(self._encoder)
        rew = deepcopy(self._rewarder)
        self.parent_conn, child_conn = multiprocessing.Pipe()
        search = multiprocessing.Process(target=deep_q_search, args=(child_conn, self.move_set, enc, rew, self._game.id,))
        search.daemon = True
        search.start()

    def choose(self):
        self.parent_conn.send(self._game)
        with open('botasdf-'+self._game.id+'.txt', 'a') as out:
            out.write('pieces: '+ str(self._game.nextPiece._id) + '\n')
        time.sleep(.6)
        move = 0
        if self.parent_conn.poll(.1):
            move = int(self.parent_conn.recv())    # Read from the output pipe
        return self.move_set[move]
        
    def get_reward(self):
        return self._rewarder.get_reward(self._game)
    
    def get_state_size(self):
        return self._encoder.get_state_size(self._game)
        
        
    def get_num_states(self):
        return self._encoder.get_num_states()
        
    def end(self, won):
        self._game.won = won
        self.parent_conn.send(self._game)
        time.sleep(.1)
        self.parent_conn.close()
            
        
        