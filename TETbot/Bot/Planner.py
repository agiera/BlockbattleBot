from Bot.Strategies.RandomStrategy import RandomStrategy
from Bot.Strategies.SARSALAMStrategy import SARSALAMStrategy
from Bot.Strategies.SearchDeepQStrategy import SearchDeepQStrategy



class Planner:
    def __init__(self, strategyType, game):
        self._switcher = {
            "random": RandomStrategy(game),
            #"sarsalambda_sa": SARSALAMStrategy(game, 'topheights', 'direct'),
            #"sarsalambda_nn": SARSALAMStrategy(game, 'flat', 'direct'),
            #"sarsalambda_lnn": SARSALAMStrategy(game, 'flatplus', 'gameplay'),
            "searchdeepq": SearchDeepQStrategy(game, 'flatplus', 'gameplay')
        }
        self._strategy = self._switcher.get(strategyType.lower())


    def makeMove(self):
        return self._strategy.choose()
        
    def won(self):
        return self._strategy.end(True)
        
    def lost(self):
        return self._strategy.end(False)