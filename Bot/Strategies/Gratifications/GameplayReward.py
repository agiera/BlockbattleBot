from .AbstractGratification import AbstractGratification

class GameplayReward(AbstractGratification):

    def get_reward(self, game):
        heights = game.me.field.get_column_heights()
        myhloss = -1*sum(heights)/10.
        #enemhloss = -1*sum(self._game.enemy.field.get_column_heights())/200.
        
        # this hopefully measures bumpiness
        bumpy = 0
        for i in range(0, 10):
            bumpy += abs(heights[i] - heights[i-1])
        bumpy /= -10.
        
        # holes
        myfield = game.me.field.field
        holes = self.get_num_holes(myfield, heights)
        holes *= -1/5.
        
        # reward for surviving
        survival = 20
        
        # points
        points = 20*game.me.round_points + 20* game.me.combo
        
        
        with open('rew.txt', 'a') as out:
            out.write('lines: '+ str([points, myhloss, bumpy, holes ,survival]) + '\n')
        
        total_reward = points + myhloss + bumpy + holes + survival
        return total_reward
        
    def get_num_holes(self, field, heights):
        holes = 0
        for i in range(10):
            for r in range(20-heights[i], 20):
                #holes += self._game.me.field.isHole((r, i))
                holes += not field[r, i]
        return holes
        
    def get_winning_reward(self, game):
        return 1000
        
    def get_losing_reward(self, game):
        return -1000
    