

class Node:
    def __init__(self, id, value, parent=None):
        self.id = id
        self.value = value
        self.parent = parent
        self.children = []

    def create_child(self, id, value, parent=None):
        new_node = Node(id, value, parent)
        self.children.append(new_node)
        return new_node

    def find_child(self, id):
        for kid in self.children:
            if kid.id == id:
                return kid
        return None
    
    def deep_remove(self):
        kids = [self]
        while len(kids) != 0:
            kid = kids.pop()
            children = kid.children
            kid.id = None
            for child in children:
                if not child.id is None:
                    kids += [child]

    def bubble_up(self, val):
        if self.parent != None:
            self.parent.value = (self.parent.value[0], self.parent.value[1]+val)
            self.parent.bubble_up(val)
    