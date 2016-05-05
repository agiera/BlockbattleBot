import numpy as np
from .AbstractEncoder import AbstractEncoder


class FlatPlusEncoder(AbstractEncoder):
    
    def get_state(self, game):
        
        my_field = game.me.field.field.flatten()
        enemy_height = sum(self.get_top_heights(game.enemy.field.field))
        
        other = np.array([enemy_height, game.piece._id, game.nextPiece._id, game.timebank], dtype=np.uint16)
        
        heights = self.get_top_heights(game.me.field.field)
        
        input = np.reshape(np.concatenate((other, heights), axis=0), (1, -1))
        
        return input
        
        
    def get_top_heights(self, field):
        top = 1
        while top < 20 and not np.any(field[top, :]):
            top += 1
        
        
        heights = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        heights[10] = 20 - top
        for column in range(0, 10):
            height = top
            while height < 20 and not field[height, column]:
                height += 1
            heights[column] = height - top
            
        return heights
        
    # this is fixed per encoder
    def get_state_size(self, game):
        return self.get_state(game).shape[1]
        
        
    def get_num_states(self):
        return -1
        
