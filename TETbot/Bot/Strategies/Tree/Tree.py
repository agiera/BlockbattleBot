from .Node import Node

class Tree:
    
    def __init__(self, id, value):
        self.root = Node(id, value)
