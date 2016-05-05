import numpy as np
import bottleneck

import os



class DeepQ:

    
    def __init__(self, state_size, num_actions, id=''):
        self.method = 'lnn'    # Q method
        self.alpha = 0.00000000005      # learning rate
        self.gamma = .5      # discount factor
        self.epsilon = .5  # probability of a random action selection
        self.lamb = .5
        self.id = id
        
        self.nactions = num_actions
        self.state_size = state_size
        
        # prevents file access at the same time
        if self.method == "sa": # normal SARSALambda with loopuptable
            #self.Q, self.e = self.build_sa_tables()
            pass
        elif self.method == "nn": # SARSALambda with neural network lookup
            self.Qhnn, self.Qnn = self.build_nn_tables(nH=100)  # the weight table for hnn and nn
        elif self.method == "lnn":
            self.Qnn = self.build_lnn_tables()
        else:
            raise ValueError('Only methods include "sa" and "nn".')
        
        self.s = None
        self.a = None
        self.x = None
        
    
    
    
    
    def build_nn_tables(self, nH=100):
        """
        Makes weight vector table: a single-row vector of values for all features
        """
        path = os.path.dirname(os.path.realpath('__file__'))
        # list is empty
        if os.path.isfile(path + "/neural_nets/nn_hn"):
            Qhnn = np.load(path + "/neural_nets/nn_hn")
            Qnn = np.load(path + "/neural_nets/nn_on")
        else:
            nfeatures = self.state_size + 1  # 1 action
            #Qhnn = 2*np.random.random((nfeatures, nH)) - 1
            #Qnn = 2*np.random.random((nfeatures, 1)) - 1
            Qhnn = np.zeros((nfeatures, nH))
            Qnn = np.zeros((nH, 1))
        return Qhnn, Qnn
        
    def build_lnn_tables(self, nH=100):
        """
        Makes weight vector table: a single-row vector of values for all features
        """
        net_path = os.path.dirname(os.path.realpath('__file__'))
        # list is empty
        if os.path.isfile(net_path + "/neural_nets/lnn_Qnn-"+self.id+".txt"):
            Qnn = np.loadtxt(net_path + "/neural_nets/lnn_Qnn-"+self.id+".txt")
        else:
            nfeatures = self.state_size + 1  # 1 action
            #Qhnn = 2*np.random.random((nfeatures, nH)) - 1
            #Qnn = 2*np.random.random((nfeatures, 1)) - 1
            Qnn = np.zeros((nfeatures, 1))
        return Qnn
        
        
        
        
    def e_greedy_selection_lnn(self, k, xp):
        '''
        Selects an action using Epsilon-greedy strategy
        Q: the Qtable
        s: the current state
        '''
        xp = np.array(xp)
        
        if np.random.random() > self.epsilon:
            # qMax = 0
            # actionMax = 0
            # for i in range(self.nactions):
                # inputp = np.hstack((xp, [[i]]))
                # qTemp = self.lin_neural_net(inputp, self.Qnn)
                # if qTemp > qMax:
                    # qMax = qTemp
                    # actionMax = i
            # a = actionMax
            valMat = np.zeros((self.nactions, xp.shape[1]+1))
            valMat[:, :-1] = xp
            valMat[:, -1] = np.array(list(range(self.nactions)))
            
            prod = self.lin_neural_net(valMat, self.Qnn)
            a = np.argpartition(-prod, k, axis=0)[:k]
        else:
            # selects index of random action based on a uniform distribution
            a = np.reshape(np.random.choice(self.nactions, k, replace=False), (-1, 1))
        return a
        
        
        
    def update_lnn(self, s, a, r, sp, ap):
        '''
        Change feature values by: alpha * (reward + gamma * Q(xp,w) - Q(x,w)) * values
        NN could use fully continuous states (or not).
        Not currently working.
        '''
        # TODO big bonus: Fix this (and/or associated functions) so it converges and learns well
        
        inputp = np.hstack((sp, [[ap]]))
        Qp = self.lin_neural_net(inputp, self.Qnn)

        inputo = np.hstack((s, [[a]]))
        Q = self.lin_neural_net(inputo, self.Qnn)

        # Transposing.T here is just to add each of the updated weights to the Q-feature table
        update = self.Qnn.T + self.alpha * (r + self.gamma * Qp - Q) * inputo
        self.Qnn = np.nan_to_num(update.T)
        
        
        
        
        
    def lin_neural_net(self, values, features):
        '''
        Single layer feed forward network with 1 output (Q).
        This is just a linear function approximation currently,
        but could be expanded.
        '''
        return np.dot(values, features)
        
        
        
        
        
    def choosek(self, k, state):
        actions = None
        if not self.a:
            self.s = state
            
            if self.method == 'sa':
                # select first action
                #actions = self.e_greedy_selection_sa(k, self.s)
                pass
            elif self.method == 'nn':
                #actions = self.e_greedy_selection_nn(k, self.s)
                pass
            elif self.method == 'lnn':
                actions = self.e_greedy_selection_lnn(k, self.s)
        
        return actions
        
        
        
    def learn(self, s, action, sp, reward):
        if self.method == 'sa':
            # select action prime
            ap = self.e_greedy_selection_sa(1, sp)

            # Update the Qtable, that is, learn from the experience
            self.update_SARSA(s, action, reward, sp, ap[0][0])
        elif self.method == 'nn':
            ap = self.e_greedy_selection_nn(1, sp)

            self.update_nn(s, action, reward, sp, ap[0][0])
        elif self.method == 'lnn':
            ap = self.e_greedy_selection_lnn(1, sp)

            self.update_lnn(s, action, reward, sp, ap[0][0])
        
        
    def save_tables(self):
        net_path = os.path.dirname(os.path.realpath('__file__'))
        if self.method == 'sa':
            np.save(net_path + "/neural_nets/sa_Q", self.Q)
            np.save(net_path + "/neural_nets/sa_e", self.e)
        elif self.method == 'nn':
            np.save(net_path + "/neural_nets/nn_hn", self.Qhnn)
            np.save(net_path + "/neural_nets/nn_on", self.Qnn)
        elif self.method == 'lnn':
            np.savetxt(net_path + "/neural_nets/lnn_Qnn-"+self.id+".txt", self.Qnn)
        
    def win(self):
        self.learn(self, self.s, 1000)
        self.save_tables()
        
    def win(self):
        self.learn(self, self.s, -1000)
        self.save_tables()
        
        
        
        
        