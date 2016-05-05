# -*- coding: utf-8 -*-
# Python3.4*

from sys import stdin, stdout

from Bot.Planner import Planner
from Bot.Game.Game import Game
from Bot.Parser import Parser
import os

from copy import deepcopy
import logging

logging.basicConfig(level=logging.DEBUG, filename='boterrors-1.log', filemode='a')

class Bot:
    def __init__(self, strategy):
        try:
            self.game = Game(id='1')
            self._parser = Parser(self.game)
            self._planner = Planner(strategy, self.game)
            with open('botout-1.txt', 'w') as out:
                out.write('hi\n')
        except:
            logging.exception("Error while constructing Bot:")

    def run(self):
        while not stdin.closed:
            try:
                line = stdin.readline().strip()
                with open('botout-1.txt', 'a') as out:
                    out.write(line + '\n')

                if len(line) == 0:
                    continue

                moves = self.interpret(line)

                if moves:
                    moves = self.game.me.field.expand_downs(deepcopy(self.game.piece), moves)
                    self.sendMoves(moves)
                    with open('botout-1.txt', 'a') as out:
                        out.write('moves: '+','.join(moves) + '\n')

            except:
                logging.exception("Error while makin moves:")
                
    def interpret(self, line):
        if line.startswith('action'):
            return self._planner.makeMove()
        elif line == 'result won':
            self.game.over = True
            self._planner.won()
        elif line == 'result lost':
            self.game.over = True
            self._planner.lost()
        else:
            self._parser.parse(line)

    @staticmethod
    def sendMoves(moves):
        stdout.write(','.join(moves) + '\n')
        stdout.flush()


if __name__ == '__main__':
    Bot("searchdeepq").run()
