# -*- coding: utf-8 -*-
# Python3.4*

from sys import stdin, stdout

from Bot.Planner import Planner
from Bot.Game.Game import Game
from Bot.Parser import Parser
from copy import deepcopy
import os
n = str(len(os.listdir('games/')))

import logging

logging.basicConfig(level=logging.DEBUG, filename='2boterrors.log', filemode='a')


def bitToPixel(bit):
    if bit:
        return ' '
    else:
        return '0'


class Bot:
    def __init__(self, strategy):
        try:
            self.game = Game(id='2')
            self._parser = Parser(self.game)
            self._planner = Planner(strategy, self.game)
        except:
            logging.exception("Error while constructing Bot:")

    def run(self):
        while not stdin.closed:
            try:
                line = stdin.readline().strip()

                if len(line) == 0:
                    continue

                moves = self.interpret(line)

                if moves:
                    moves = self.game.me.field.expand_downs(deepcopy(self.game.piece), moves)
                    self.sendMoves(moves)
                    lines = [''.join(list(map(bitToPixel, l))) for l in self.game.me.field.field]
                    board = '\n'.join(lines) + "\n\n"
                    with open('games/game-' + n + '.txt', 'a') as out:
                        out.write(board)

            except:
                logging.exception("2Error while makin moves:")

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
