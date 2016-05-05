
class AbstractEncoder:
    def __init__(self, game):
        self._game = game
        self._actions = ['left', 'right', 'turnleft', 'turnright', 'down', 'drop']

    def __get_state(self, game):
        """
        overwrite this function for your specific problem
        """
        # return a vector states
        # this is typically a combinatorial discretization of the input space
        # return state
        