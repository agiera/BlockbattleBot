from .Tree import Tree

class TETTree(Tree):

    def __init__(self, id, value):
        Tree.__init__(self, id, value)

    def filter_for_next_piece(self, piece):
        loss = 0
        for kid1 in self.root.children:
            loss1 = 0
            for kid2 in kid1.children:
                if kid2.id[0] != piece:
                    loss1 += kid2.value[1]
                    kid2.deep_remove()
            kid1.children = [node for node in kid1.children if node.id != None]
            kid1.value = (kid1.value[0], kid1.value[1]-loss1)
            loss += loss1
        self.root.value = (self.root.value[0], self.root.value[1] - loss)

    def max_move(self):
        move = (0, -10000000000)
        child = None
        for kid in self.root.children:
            if kid.value[1] > move[1]:
                move = (kid.id[1], kid.value[1])
                child = kid
        for kid in self.root.children:
             if kid != child:
                kid.deep_remove()
        self.root = child
        return move[0]
        
        
