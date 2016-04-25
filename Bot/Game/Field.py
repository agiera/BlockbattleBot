import numpy as np

class Field:
    def __init__(self):
        self.width = 10
        self.height = 20
        self.field = np.zeros((self.height, self.width), dtype=bool)

    def size(self):
        return self.width, self.height

    def updateField(self, field):
        self.field = field

    def __checkIfPieceFits(self, piecePositions):
        for x,y in piecePositions:
            if 0 <= x < self.width and 0 <= y < self.height:
                if self.field[y][x]:
                    return False
            else:
                return False
        return True

    def fitPiece(self, piecePositions):
        field = np.copy(self.field)
        if self.__checkIfPieceFits(piece):
            for x,y in piece:
                field[y][x] = True

            return field
        else:
            return None
            
    # gets falling distance for piece's coords
    def piece_height(self, coords):
        heights = [self.cell_hieght(coord) for coord in coords]
        return min(heights)
      
    # empty blocks between this cell and first non-empty block
    def cell_hieght(self, coord):
        h = 0
        x = coord[0]
        y = coord[1]
        # sometimes y > 19
        if y < 0:
            y = 0
            h -= y
        while y > 19 and self.field[y + 1, x]:
            h += 1
            y += 1
        return h
        
    def expand_downs(self, piece, move):
        i = move.index('down')
        if i == -1: return move
        rotation = (move[:i].count('turnright') - move[:i].count('turnleft')) % 4
        cells = piece._rotations[rotation]
        moved = [(x + move[:i].count('right') - move[:i].count('left'), y) for (x, y) in cells]
        k = self.piece_height(moved)
        downs = ['down' for j in range(k)]
        return move[:i] + downs + move[i+1:]
        
    def project_move(self, piece, move):
        if move.count('down') == 1:
            move = expand_downs(piece, move)
        rotation = (move.count('turnright') - move.count('turnleft')) % 4
        cells = piece._rotations[rotation]
        rotated = [(x + game.piecePosition[0], y + game.piecePosition[1]) for (x, y) in cells]
        downed = [(x, y - move.count('down')) for (x, y) in rotated]
        moved = [(x + move.count('right') - move.count('left'), y) for (x, y) in downed]
        return fitPiece(moved)
            
    def lines_completed_by_piece(self, piece, move):
        proj = project_move(piece, move)
        if proj == None:
            return 0
        lines = 0
        for row in proj.T:
            lines += np.all(row)
        return lines
        
    def get_column_heights(self):
        heights = []
        for i in range(self.width):
            h = 0
            while h < 19 and not self.field[h+1, i]:
                h += 1
            heights.append(19 - h)
        return heights
        
        
    def is_losing_field(self):
        for i in range(10):
            if self.field[0, i] and self.field[1, i]:
                return True
        return False
        
    def isHole(self, coord): # if there blocks above this it is a hole
        return np.any(self.field[1:coord[1], coord[0]]) and \
                not self.field[coord[1], coord[0]]
        
    def simulate_move(self, piece, move):
        new_field, tspin = self.make_move(piece, move)
        if new_field is None:
            return None, -1, False, False
        cleared = new_field.clear_lines()
        complete = not np.any(new_field.field)
        return new_field, cleared, tspin, complete
    
    def clear_lines(self):
        lines = 0
        for i in range(20):
            if np.all(self.field[i, :]):
                self.clear_line(i)
                lines += 1
        return lines
        
    def clear_line(self, i):
        for j in range(i):
            self.field[i+1, :] = self.field[i, :]
        self.field[0, :] = 0
            
    def make_move(self, piece, move):
        rotation = 0
        for atom in move:
            if atom == 'left':
                piece._rotations = [[(x - 1, y) for (x, y) in rot] for rot in piece._rotations]
                if not self.piece_fits(piece._rotations[rotation]):
                    return None, False
            elif atom == 'right':
                piece._rotations = [[(x + 1, y) for (x, y) in rot] for rot in piece._rotations]
                if not self.piece_fits(piece._rotations[rotation]):
                    return None, False
            elif atom == 'turnleft':
                rotation = (rotation - 1) % 4
                if not self.piece_fits(piece._rotations[rotation]):
                    return None, False
            elif atom == 'turnright':
                rotation = (rotation + 1) % 4
                if not self.piece_fits(piece._rotations[rotation]):
                    return None, False
            elif atom == 'down':
                piece._rotations = [self.project_piece_down(cells) for cells in piece._rotations]
            elif atom == 'drop':
                cells = self.project_piece_down(piece._rotations[rotation])
        for (x, y) in cells:
            if y < 0:
                return None, False
        new_field = Field()
        new_field.field = np.copy(self.field)
        for (x, y) in cells:
            new_field.field[y, x] = True
        return new_field, self.is_t_spin(cells, piece._id)
        
        
    def is_t_spin(self, cells, id):
        if id != 160: # id of t shape
            return False
        for (x, y) in cells:
            if ((x + 1, y) in cells and (x - 1, y) in cells) or \
               ((x, y + 1) in cells and (x, y - 1) in cells):
               # this is the center cell of a t
                if x+1 < 10 or x-1 >= 0 or y+1 < 20 or y-1 >= 0:
                    return False
                if self.field[y+1, x+1] + self.field[y-1, x+1] + \
                   self.field[y+1, x-1] + self.field[y-1, x-1]:
                    # if four of the four corners of the t is field it is a t spin
                    return True
        return False
                
    def project_piece_down(self, cells):
        fall = True
        while fall:
            if self.piece_fits([(x, y+1) for (x, y) in cells]):
                cells = [(x, y+1) for (x, y) in cells]
            else:
                fall = False
        return cells
            
    def piece_fits(self, cells):
        for (x, y) in cells:
            if y > 19 or x < 0 or x > 9:
                return False
            elif y > 0 and self.field[y, x]: # the top row always has the current piece
                return False
        return True
        
            
            
            
            
            
            