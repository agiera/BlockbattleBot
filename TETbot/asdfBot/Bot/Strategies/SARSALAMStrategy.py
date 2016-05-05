from random import randint

from ..Strategies.AbstractStrategy import AbstractStrategy
from ..Strategies.SARSALAM import SARSALAM
import numpy as np


class SARSALAMStrategy(AbstractStrategy, SARSALAM):
    def __init__(self, game, encoder, rewarder):
        AbstractStrategy.__init__(self, game, encoder, rewarder)
        # the method is integral to the encoder
        # nn could do topheights, but topheights is better on sa
        if encoder == 'flat':
            method = 'lnn'
        elif encoder == 'topheights':
            method = 'sa'
        elif encoder == 'flatplus':
            method = 'lnn'
        SARSALAM.__init__(self, method=method, id=self._game.id)
        self.prev_state = None

    def choose(self):
        if self.prev_state != None:
            self.learn(self.prev_state, self.get_reward())
        self.prev_state = self._encoder.get_state(self._game)
        return self.choose_round_action(self.prev_state)
        
    def get_reward(self):
        return self._rewarder.get_reward(self._game)
    
    def get_state_size(self):
        return self._encoder.get_state_size(self._game)
        
        
    def get_num_states(self):
        return self._encoder.get_num_states()
        
    def end(self, won):
        if won:
            self.learn(self.prev_state, self._rewarder.get_winning_reward(self._game))
        else:
            self.learn(self.prev_state, self._rewarder.get_losing_reward(self._game))
        self.save_tables()
            
        
        