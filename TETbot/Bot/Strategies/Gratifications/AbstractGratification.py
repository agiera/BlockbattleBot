
class AbstractGratification:

    def __get_reward(self, game):
        """
        overwrite this function for your specific problem
        """
        # return a value for the move
        
        
    def get_winning_reward(self, game):
        return 1000
    
    def get_losing_reward(self, game):
        return -1000
