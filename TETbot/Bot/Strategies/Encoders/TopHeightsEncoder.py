import numpy as np
from .AbstractEncoder import AbstractEncoder
from bitarray import bitarray

import os
t = str(len(os.listdir()))

class TopHeightsEncoder(AbstractEncoder):
    
    def get_state(self, game):
        
        # the height of the 10 columns bounded from 0 to 3 
        # takes up 2*10 + 4 = 24 bits
        heights = self.get_top_heights(game.me.field.field)
        
        # takes up \sim 3*2 = 6 bits
        piece1 = game.piece._id # from 0 to 7
        piece2 = game.piece._id # from 0 to 7
        
        # takes up 1 bit
        # whether p2 is past the 10 line mark
        #p2 = self.get_p2_height(game.enemy.field) # not worth it
        
        return self.state_to_index(heights, piece1, piece2)
        
    def get_top_heights(self, field):
        top = 19
        while not np.any(field[top, :]):
            top -= 1
        
        # the top three lines
        heights = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        # 15 is easier to pack and stategies shouldn't change much
        heights[10] = min(top, 15)
        for column in range(0, 10):
            height = top
            while not field[height, column] or height > top-3:
                height -= 1
            heights[column] = 3 - top + height
            
        return heights
        
    def get_p2_heigth(self, p2field):
        height = 19
        while not np.any(field[top, :]):
            height -= 1
        if height > 10:
            return True
        else:
            return False
        
    def state_to_index(self, heights, piece1, piece2):
        index = 0
        order = 0 # bit packing using an order as the bit index
        for i in range(10):
            if heights[i] == 0:
                order += 2
            elif heights[i] == 1:
                index += 2**order
                order += 2
            elif heights[i] == 2:
                order += 1
                index += 2**order
            elif heights[i] == 3:
                index += 2**order
                order += 1
                index += 2**order
                order += 1
            else:
                raise ValueError("A proper height will never exceed three.")
                
        # log bit reading alg
        for i in range(4):
            if heights[10] & 1 == 1:
                index += 2**order
                order += 1
                heights[10] = heights[10] << 1
                
        for i in range(3):
            if piece1 & 1 == 1:
                index += 2**order
                order += 1
                piece1 = piece1 << 1
                
        for i in range(3):
            if piece2 & 1 == 1:
                index += 2**order
                order += 1
                piece2 = piece1 << 1
                
                
        if index > 2**30:
            raise ValueError("The index of this state was impossibly large.")
    
        return index
        
    def get_state_size(self):
        return 30 # bits
        
        
    def get_num_states(self):
        return 2**30 - 1
    
    
    
    