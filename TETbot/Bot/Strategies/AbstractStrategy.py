from .Encoders.FlatEncoder import FlatEncoder
from .Encoders.TopHeightsEncoder import TopHeightsEncoder
from .Encoders.FlatPlusEncoder import FlatPlusEncoder
from .Gratifications.DirectReward import DirectReward
from .Gratifications.GameplayReward import GameplayReward
import numpy as np

class AbstractStrategy:
    def __init__(self, game, encoder, rewarder):
        self._game = game
        self._action_list = self.build_action_list()
        self._encoder_switcher = {
            "flat": FlatEncoder(game),
            "topheights" : TopHeightsEncoder(game),
            "flatplus": FlatPlusEncoder(game)
        }
        self._gratification_switcher = {
            "direct": DirectReward(),
            "gameplay": GameplayReward()
        }
        self._encoder = self._encoder_switcher.get(encoder.lower())
        self._rewarder = self._gratification_switcher.get(rewarder.lower())
        self._atomic_actions = ['left', 'right', 'turnleft', 'turnright', 'down', 'drop']

    def choose(self):
        raise NotImplementedError("Please Implement this method")
        
    # I decided to put this here because
    # all possible useful actions are limited to these and they are very few
    def build_action_list(self):
        # consider T spins when constraining this list
        # can only go a max of 4 left and 4 right
        # there are at most two lefts and or two rights in a row
        # the only competitive way to use down is to get to some ledge and it is only useful in one string per moves ever so I will only include a string in any move
            # this will be done by inserting a single down in for the choice and then replacing it later with the required amount to get to the bottom of the ledge
        #m, t, do, t, m, dr
        # this creates a very managable 81 move moveset
        
        #I might be missing some so fix this later!
        
        ms = [['right' for j in range(i)] for i in range(5)] + \
             [['left' for j in range(i)] for i in range(1, 5)]
        t2s = [['turnright' for j in range(i)] for i in range(2)] + \
              [['turnleft' for j in range(i)] for i in range(1, 2)]
        dms = [['down'], ['down', 'right'], ['down', 'left']]
        t1s = [['turnright' for j in range(i)] for i in range(1)] + \
              [['turnleft' for j in range(i)] for i in range(1, 1)]
        
        moveset = np.array([m + t2 + dm + t1 + ['drop'] for m in ms for t2 in t2s for dm in dms for t1 in t1s])
        
        
        return moveset
        
    # this will be used to get reward
    def __get_reward(self):
        raise NotImplementedError("Please Implement this method")
        
    def __end(self, result):
        raise NotImplementedError("Please Implement this method")
        
        
        
        
        
