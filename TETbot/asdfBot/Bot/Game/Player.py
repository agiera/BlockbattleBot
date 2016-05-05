from .Field import Field


class Player:
    def __init__(self, name=None):
        self.name = name
        self.row_points = 0
        self.round_points = 0
        self.combo = 0

        self.field = Field()

    def updateRowPoints(self, rowPoints):
        self.rowPoints = rowPoints

    def updateCombo(self, combo):
        self.combo = combo

    # TODO: Maybe add some uncertanty states for other players
    