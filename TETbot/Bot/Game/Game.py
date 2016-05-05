from .Player import Player
from .Piece import *

import numpy as np

from copy import deepcopy




class Game:
    def __init__(self, id=''):
        self.over = False
        self.timebank = 0
        self.timePerMove = 0

        self.enemy = Player()
        self.me = Player()
        self.id = id

        self.piece = Piece()
        self.piecePosition = (0, 0)
        self.nextPiece = Piece()
        self.round = 0
        self.won = -1
        
    def get_pieces(self):
        if self.piece._id != 0:
            return [self.piece]
        else:
            return [LPiece(), OPiece(), IPiece(), JPiece(), SPiece(), TPiece(), ZPiece()]

    def simulate_game(self, move):
        if self.piece._id == 0:
            return None
        new_field, lines, tspin, complete = self.me.field.simulate_move(deepcopy(self.piece), move)
        if new_field is None:
            return None
        new_game = Game()
        new_game.me.field = new_field
        new_game.piece = self.nextPiece
        if complete:
            new_game.me.round_points = 18
        else:
            if lines == 2:
                new_game.me.row_points = 3
            elif lines == 3:
                new_game.me.row_points = 6
            elif lines == 4:
                new_game.me.row_points = 10
        if lines > 0:
            new_game.me.combo = self.me.combo + 1
        new_game.row_points = new_game.me.round_points + self.me.row_points
        return new_game
        
    def set_pieces(self, pieceid, piecenextid):
        switcher = {
            10: LPiece(),
            40: OPiece(),
            70: IPiece(),
            100: JPiece(),
            130: SPiece(),
            160: TPiece(),
            190: ZPiece()
        }
        
        self.piece = switcher.get(pieceid)
        self.nextPiece = switcher.get(piecenextid)
        
            