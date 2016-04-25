import numpy as np
from .AbstractEncoder import AbstractEncoder

import os
t = str(len(os.listdir()))

class FlatEncoder(AbstractEncoder):
    
    def get_state(self, game):
        
        my_field = game.me.field.field.flatten()
        enemy_height = self.get_height(game.enemy.field.field)
        
        other = np.array([enemy_height, game.piece._id, game.nextPiece._id, game.timebank], dtype=np.uint16)
        input = np.reshape(np.concatenate((my_field, other), axis=0), (1, -1))
        
        #TODO: maybe switch to transpose?
        return input
        
        
    def get_height(self, field):
        heights = []
        for i in range(10):
            h = 19
            while field[h, i] and h > 0:
                h -= 1
            heights.append(h)
        return sum(heights)/10
        
    def get_state_size(self, game):
        return self.get_state(game).shape[1]
        
        
    def get_num_states(self):
        return -1
        
