from .AbstractGratification import AbstractGratification

class DirectReward(AbstractGratification):

    def get_reward(self, game):
        return game.me.round_points

    
        
    def get_winning_reward(self, game):
        return 1000
        
    def get_losing_reward(self, game):
        return -1000