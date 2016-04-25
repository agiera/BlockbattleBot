from Bot.Game import Piece
import numpy as np



class Parser:
    def __init__(self, game):
        self._game = game
        self._playerNames = []

    def parse(self, line):
        parts = line.split()

        if parts[0] == 'settings':
            self.set(parts[1:])
        elif parts[0] == 'update':
            self.update(parts[1:])

    def set(self, values):
        if values[0] == 'player_names':
            self._playerNames = values[1].split(',')

        elif values[0] == 'your_bot':
            self._game.me.name = values[1]
            self._playerNames.remove(values[1])
            self._game.enemy.name = self._playerNames[0]

        elif values[0] == 'field_width':
            self._game.me.field.width = int(values[1])
            self._game.enemy.field.width = int(values[1])

        elif values[0] == 'field_height':
            self._game.me.field.height = int(values[1])
            self._game.enemy.field.height = int(values[1])

        elif values[0] == 'timebank':
            self._game.timebank = int(values[1])

        elif values[0] == 'time_per_move':
            self._game.timePerMove = int(values[1])

    def update(self, values):
        if values[0] == 'game':
            self.updateGame(values[1:])
        else:
            self.updatePlayer(values[0], values[1:])

    def updateGame(self, values):
        if  values[0] == 'this_piece_type':
            self._game.piece = Piece.create(values[1])

        elif  values[0] == 'next_piece_type':
            self._game.nextPiece = Piece.create(values[1])

        elif values[0] == 'round':
            self._game.round = int(values[1])

    def updatePlayer(self, playerName, values):
        if playerName != self._game.me.name:
            player = self._game.enemy
        else:
            player = self._game.me

        if values[0] == 'field':
            field_lines = values[1].split(';')
            field = [list(map(int, line.split(','))) for line in field_lines]
            player.field.updateField(np.array(field, dtype=bool))
            
        elif values[0] == 'combo':
            player.combo = int(values[1])
        elif values[0] == 'row_points':
            player.round_points = int(values[1]) - player.row_points
            player.row_points = int(values[1])
