
def create(type):
    switcher = {
        "L": LPiece(),
        "O": OPiece(),
        "I": IPiece(),
        "J": JPiece(),
        "S": SPiece(),
        "T": TPiece(),
        "Z": ZPiece()
    }

    return switcher.get(type.upper())
    
    
class Piece:
    def __init__(self):
        self._rotateIndex = 0
        self._rotations = []
        self._id = 0

    def turnLeft(self, times=1):
        if self._rotateIndex > times-1:
            self._rotateIndex -= times
            return True
        return False

    def turnRight(self, times=1):
        if self._rotateIndex < len(self._rotations) - times:
            self._rotateIndex += times
            return True
        return False

    def rotateCount(self):
        return self._rotateIndex

    def positions(self):
        return self._rotations(self._rotateIndex)

    def appendRotation(self, rotation):
        self._rotations.append(rotation)
        
    def _set_position(self, position):
        for i in range(len(self._rotations)):
            for j in range(len(self._rotations[i])):
                self._rotations[i][j] = (self._rotations[i][j][0] + position[0], self._rotations[i][j][1] + position[1])
    

class LPiece(Piece):
    def __init__(self):
        Piece.__init__(self)
        # rotations ordered by their rotation to the right
        self._rotations.append([(2, 0), (0, 1), (1, 1), (2, 1)])
        self._rotations.append([(1, 0), (1, 1), (1, 2), (2, 2)])
        self._rotations.append([(0, 1), (1, 1), (2, 1), (0, 2)])
        self._rotations.append([(0, 0), (1, 0), (1, 1), (1, 2)])
        self._rotations = [[(x+3, y-1) for (x, y) in rot] for rot in self._rotations]
        self._id = 10

class OPiece(Piece):
    def __init__(self):
        Piece.__init__(self)
        self._rotations.append([(0, 0), (1, 0), (0, 1), (1, 1)])
        self._rotations.append([(0, 0), (1, 0), (0, 1), (1, 1)])
        self._rotations.append([(0, 0), (1, 0), (0, 1), (1, 1)])
        self._rotations.append([(0, 0), (1, 0), (0, 1), (1, 1)])
        self._rotations = [[(x + 4, y-1) for (x, y) in rot] for rot in self._rotations]
        self._id = 40

class IPiece(Piece):
    def __init__(self):
        Piece.__init__(self)
        # rotations ordered by their rotation to the right
        self._rotations.append([(0, 0), (1, 0), (2, 0), (3, 0)])
        self._rotations.append([(2, -1), (2, 0), (2, 1), (2, 2)])
        self._rotations.append([(0, 1), (1, 1), (2, 1), (3, 1)])
        self._rotations.append([(1, -1), (1, 0), (1, 1), (1, 2)])
        self._rotations = [[(x+3, y-1) for (x, y) in rot] for rot in self._rotations]
        self._id = 70

class JPiece(Piece):
    def __init__(self):
        Piece.__init__(self)
        # rotations ordered by their rotation to the right
        self._rotations.append([(0, 0), (0, 1), (1, 1), (2, 1)])
        self._rotations.append([(1, 0), (2, 0), (1, 1), (1, 2)])
        self._rotations.append([(0, 1), (1, 1), (2, 1), (2, 2)])
        self._rotations.append([(1, 0), (1, 1), (0, 2), (1, 2)])
        self._rotations = [[(x+3, y-1) for (x, y) in rot] for rot in self._rotations]
        self._id = 100

class SPiece(Piece):
    def __init__(self):
        Piece.__init__(self)
        # rotations ordered by their rotation to the right
        self._rotations.append([(1, 0), (2, 0), (0, 1), (1, 1)])
        self._rotations.append([(1, 0), (1, 1), (2, 1), (2, 2)])
        self._rotations.append([(1, 1), (2, 1), (0, 2), (1, 2)])
        self._rotations.append([(0, 0), (0, 1), (1, 1), (1, 2)])
        self._rotations = [[(x+3, y-1) for (x, y) in rot] for rot in self._rotations]
        self._id = 130

class TPiece(Piece):
    def __init__(self):
        Piece.__init__(self)
        # rotations ordered by their rotation to the right
        self._rotations.append([(1, 0), (0, 1), (1, 1), (2, 1)])
        self._rotations.append([(1, 0), (1, 1), (2, 1), (1, 2)])
        self._rotations.append([(0, 1), (1, 1), (2, 1), (1, 2)])
        self._rotations.append([(1, 0), (0, 1), (1, 1), (1, 2)])
        self._rotations = [[(x + 3, y - 1) for (x, y) in rot] for rot in self._rotations]
        self._id = 160

class ZPiece(Piece):
    def __init__(self):
        Piece.__init__(self)
        self._rotations.append([(0, 0), (1, 0), (1, 1), (2, 1)])
        self._rotations.append([(2, 0), (1, 1), (2, 1), (1, 2)])
        self._rotations.append([(0, 1), (1, 1), (1, 2), (2, 2)])
        self._rotations.append([(1, 0), (0, 1), (1, 1), (0, 2)])
        self._rotations = [[(x+3, y-1) for (x, y) in rot] for rot in self._rotations]
        self._id = 190
