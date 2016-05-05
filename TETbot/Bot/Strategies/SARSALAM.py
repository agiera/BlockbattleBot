


import numpy as np
import time
import os

# %%


import logging
logging.basicConfig(level=logging.DEBUG, filename='nnloadingprobs-.log', filemode='w')




def tanh_prime(x):
    return (4*np.cosh(x)**2)/((np.cosh(2*x) + 1)**2)
    
    
    
class SARSALAM:
    def __init__(self, alpha=0.00000000005, gamma=.5, epsilon=.5, lamb=.9, method='nn', id=''):
        super(SARSALAM, self).__init__()
        self.id = id
        

        self.actionlist = self.build_action_list()  # the list of actions
        self.nactions = self.actionlist.shape[0]  # number of actions
        self.state_size = self.get_state_size()    # number of states
        self.nstates = self.get_num_states()
        
        self.method = method    # Q method
        self.alpha = alpha      # learning rate
        self.gamma = gamma      # discount factor
        self.epsilon = epsilon  # probability of a random action selection
        self.lamb = lamb
        
        # prevents file access at the same time
        while True:
            try:
                if self.method == "sa": # normal SARSALambda with loopuptable
                    #self.Q, self.e = self.build_sa_tables()
                    pass
                elif self.method == "nn": # SARSALambda with neural network lookup
                    self.Qhnn, self.Qnn = self.build_nn_tables(nH=100)  # the weight table for hnn and nn
                elif self.method == "lnn":
                    self.Qnn = self.build_lnn_tables()
                else:
                    raise ValueError('Only methods include "sa" and "nn".')
                break
            except:
                logging.exception("Error while loading nns:"+self.id)
                time.sleep(np.random.random()/10.)
                continue
        
        self.s = None
        self.a = None
        self.x = None
        
        
    def __get_state_size(self):
        """
        overwrite this function for your specific problem
        """
        # return state_size
        
        
    def __build_action_list(self):
        """
        overwrite this function for your specific problem
        """
        # return a single array of real actions to be perfomed by the DoAction function
        # return actionlist

    def __get_num_states(self):
        """
        overwrite this function for your specific problem
        """
        # return an array of vector states
        # this is typically a combinatorial discretization of the input space
        # return statelist

    def __get_reward(self, x):
        """
        overwrite this function for your specific problem
        """
        # r the current reward
        # f = True if the Goal is reached False otherwise
        # return r, f

    def __do_action(self, force, x):
        """
        overwrite this function for your specific problem
        """
        # return xp, the new system state as an ND-vector
        # return xp
        
    def build_sa_tables(self):
        path = os.path.dirname(os.path.realpath('__file__'))
        # cache is not there
        if os.path.isfile(path + "/neural_nets/sa_Q"):
            Q = np.load(path + "/neural_nets/sa_Q")
            e = np.load(path + + "/neural_nets/sa_e")
        else:
            Q = np.zeros((self.nstates, self.nactions), dtype=np.float)  # the Qtable
            e = np.zeros((self.nstates, self.nactions), dtype=np.float)  # rolling-calculated eligibility trace
        return Q, e
        
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
        
    def e_greedy_selection_sa(self, s):
        '''
        Selects an action using Epsilon-greedy strategy
        Q: the Qtable
        s: the current state
        '''
        if np.random.random() > self.epsilon:
            a = np.argmax(self.Q[s])
        else:
            # selects index of random action based on a uniform distribution
            a = np.random.randint(0, self.nactions)
        return self.actionlist[a]
        
    def e_greedy_selection_nn(self, xp):
        '''
        Selects an action using Epsilon-greedy strategy
        Q: the Qtable
        s: the current state
        '''
        if np.random.random() > self.epsilon:
            qMax = 0
            actionMax = 0
            for i in range(self.nactions):
                inputp = np.vstack((xp, np.reshape(np.array([[i]]), (1, 1))))
                qTemp = self.h_neural_net(inputp, self.Qnn)
                if qTemp > qMax:
                    qMax = qTemp
                    actionMax = i
            a = self.actionlist[actionMax]
        else:
            # selects index of random action based on a uniform distribution
            a = self.actionlist[np.random.randint(0, self.nactions)]
        return a
        
    def e_greedy_selection_lnn(self, xp):
        '''
        Selects an action using Epsilon-greedy strategy
        Q: the Qtable
        s: the current state
        '''
        xp = np.array(xp)
        
        if np.random.random() > self.epsilon:
            qMax = 0
            actionMax = 0
            for i in range(self.nactions):
                inputp = np.hstack((xp, [[i]]))
                qTemp = self.lin_neural_net(inputp, self.Qnn)
                if qTemp > qMax:
                    qMax = qTemp
                    actionMax = i
            a = actionMax
        else:
            # selects index of random action based on a uniform distribution
            a = np.random.randint(0, self.nactions)
        return a
        
        
    def update_sa(self, s, a, r, sp, ap):
        # Update the Qtable, using rollback
        delta = r + self.gamma * self.Q[sp][ap] - self.Q[s][a]
        self.e[s][a] += 1
                
        self.Q = self.Q + self.alpha * delta * self.e
        self.e = self.gamma * self.lamb * self.e
        
    def update_nn(self, x, a, r, xp, ap):
        '''
        Change feature values by: alpha * (reward + gamma * Q(xp,w) - Q(x,w)) * values
        NN could use fully continuous states (or not).
        Not currently working.
        '''
        # TODO big bonus: Fix this (and/or associated functions) so it converges and learns well
        
        actionP = self.actionlist[ap]
        inputp = np.hstack((xp, actionP))
        Qp = self.hneuralNet(inputp, self.Qnn)

        actionO = self.actionlist[a]
        inputo = np.hstack((x, actionO))
        Q = self.hneuralNet(inputo, self.Qnn)

        # Transposing.T here is just to add each of the updated weights to the Q-feature table
        l2_delta = (r + self.gamma * Qp - Q) * self.l1.T * tanh_prime(Q)
        self.Qnn += self.alpha * l2_delta
        # hidden layer update
        l1_delta = l2_delta.dot(self.Qhnn.T) * tanh_prime(self.l1)
        self.Qhnn += inputo.T.dot(l1_delta) * self.alpha
        
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
        
    def h_neural_net(self, values, features):
        '''
        Single layer feed forward network with 1 output (Q).
        This is just a linear function approximation currently,
        but could be expanded.
        '''
        self.l1 = np.tanh(np.dot(values, self.Qhnn))
        return np.tanh(np.dot(self.l1, features))
        
    def lin_neural_net(self, values, features):
        '''
        Single layer feed forward network with 1 output (Q).
        This is just a linear function approximation currently,
        but could be expanded.
        '''
        return np.dot(values, features)

        
    def choose_round_action(self, state):
        if not self.a:
            self.s = state
            
            if self.method == 'sa':
                # select first action
                self.a = self.e_greedy_selection_sa(self.s)
            elif self.method == 'nn':
                self.a = self.e_greedy_selection_nn(self.s)
            elif self.method == 'lnn':
                self.a = self.e_greedy_selection_lnn(self.s)
        
        return list(self.actionlist[self.a])
        
        
        
    def learn(self, sp, reward):
        if self.method == 'sa':
            # select action prime
            ap = self.e_greedy_selection_sa(sp)

            # Update the Qtable, that is, learn from the experience
            self.update_SARSA(self.s, self.a, reward, sp, ap)
        elif self.method == 'nn':
            ap = self.e_greedy_selection_nn(sp)

            self.update_nn(self.s, self.a, reward, sp, ap)
        elif self.method == 'lnn':
            ap = self.e_greedy_selection_lnn(sp)

            self.update_lnn(self.s, self.a, reward, sp, ap)
            
        # update the current variables
        self.s = sp
        self.a = ap
        
        
    def save_tables(self):
        # prevents file access at the same time
        while True:
            try:
                net_path = os.path.dirname(os.path.realpath('__file__'))
                if self.method == 'sa':
                    np.save(net_path + "/neural_nets/sa_Q", self.Q)
                    np.save(net_path + "/neural_nets/sa_e", self.e)
                elif self.method == 'nn':
                    np.save(net_path + "/neural_nets/nn_hn", self.Qhnn)
                    np.save(net_path + "/neural_nets/nn_on", self.Qnn)
                elif self.method == 'lnn':
                    np.savetxt(net_path + "/neural_nets/lnn_Qnn-"+self.id+".txt", self.Qnn)
                break
            except:
                logging.exception("Error while loading nns:"+self.id)
                time.sleep(np.random.random()/100.)
                continue
            
        
        
        
        
        