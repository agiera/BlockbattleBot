from random import randint

from ..Strategies.AbstractStrategy import AbstractStrategy


class RandomStrategy(AbstractStrategy):
    def __init__(self, game, encoder="flat", rewarder="direct"):
        AbstractStrategy.__init__(self, game, encoder, rewarder)

    def choose(self):
        ind = [randint(0, 4) for _ in range(1, 10)]
        moves = [self._atomic_actions[i] for i in ind]
        moves.append('drop')

        return moves

    def get_reward(self):
        return 0
        
    def end(self):
        pass