# Programming/conceptual questions on Automata machines (2nd technical phone interview).
# This gets into some potentially daunting CS stuff, but no prior knowledge was needed
# or expected to answer the questions.
#
#                       +-1-+
#                       |   |
#                       |   v
#     +-------+       +-------+       +-------+
# --->|   A   | --1-->|   B   | --0-->|   C   |
#     +-------+       +-------+       +-------+
#         |                              |  |
#         |      +-------+               |  0
#         +--0-->|   E   |<------1-------+  |
#                +-------+                  v
#                 |     ^              +------------+
#                 |     |          +---| D (accept) |
#                 +-0,1-+          |   +------------+
#                                  |       ^
#                                  |       |
#                                  +--0,1--+
#
# Definitiion: A deterministic finite automaton (DFA) takes an array of 0s and 1s as input
# and outputs true/false (accepts/rejects the input) depending on the state of the machine.
# For example, an input of [1, 1, 0, 0] would lead to an accept state in this machine, and
# an input of [0,1] would lead 

# QUESTION 1: What are all the inputs that this machine accepts?
#
# Answer: If input starts with 0, we'll go to state E and be stuck, so the input
# must begin wtih 1. We can have any number of leading 1s and remain in state B.
# To get to state D, the leading 1s must eventually be followed by a sequence of two 0s.
# If the leading 1s are followed by 0,1 we will again be stuck in state E. Therefore,
# accepted inputs must take the form 1,(1),0,0,... where the sequence inside () repeats
# an arbitrary number of times and ... can be any sequence of 0s and 1s.

# QUESTION 2: Write a Node class to simulate a DFA. A Node has a boolean 'accept'
# property, and a next_state property that is a 2-element array defining which node
# to proceed to given either a 0 or a 1.

class Node
  def initialize(next_state, accept)
    @accept = accept
    @next_state = next_state # [Node.new([], True), Node.new([], False)]
  end 
   
  def simulate(start_node, input)
    return self.accept if input == []
    first = input.shift
    simulate(start_node.next_state[first], input)
  end
end

# Definitiion: Non-Deterministic Finite Automata (NFA). Similar to DFAs, but a few key
# differences: each state does not necessarily define what to do given an input of
# either a 0 or 1, and a DFA accepts a certain input if and only if there exists a path
# from the start node to an accept node that consumes the entire input. The other
# significant different is the existence of e (empty/epsilon) transitions, which can be
# traversed without consuming input.
# For example, the input [0,0] would be accepted by this machine, since we can get from 
# A to C for free, then to E and to G using the two 0s, and then to H for free, but the
# input [0,0,1] would be rejected.
#                      |
#                      |
#                      v
#                 +----------+
# +-------------->|    A     |<----------------+
# |               +----------+                 |
# |                 |     |                    |
# |        +---e----+     +------e----+        |
# |        |                          |        |
# |        v                          v        |
# |   +----------+              +-----------+  |
# |   |    B     |              |     C     |  |
# |   +----------+              +-----------+  |
# |        |                          |        |
# |        1                          0        |
# e        |                          |        e
# |        v                          v        |
# |   +----------+              +-----------+  |
# |   |    D     |              |     E     |  |
# |   +----------+              +-----------+  |
# |        |                          |        |
# |        1                          0        |
# |        |                          |        |
# |        v                          v        |
# |   +----------+              +-----------+  |
# +---|    F     |              |     G     |--+
#     +----------+              +-----------+
#          |                          |
#          |       +------------+     |
#          +--e--->| H (accept) |<--e-+
#                  +------------+

# QUESTION 3: What are all the inputs that this machine accepts?
#
# Answer: ((00)||(11)), i.e., all sequences consisting only of consecutive sequences
# of an even number of 0s and 1s. For example, [0,0,1,1,1,1,0,0], or [1,1,1,1].

# QUESTION 4: Write a function that takes an array of nodes as input, and returns an
# array of all the nodes reachable from any input node by only epsilon transitions.
# For example,
# [A] -> [A, B, C]
# [B, C] -> [B, C]
# [F] -> [F, H, A, B, C]
#
# We can assume the Node class from above is implemented so that each node has an
# epsilon property returning the array of nodes reachable in one epsilon transition
# For example, F.epsilon == [H, A]

# This question is still a work in progress for me... contributions welcome.
# the case that's problematic is when two states both have epsilon transitions
# to each other. In this case the base case of node.epsilon == [] will never happen
# and the program won't terminate. I think we need to keep track of previously
# visited nodes in the parameters of single_epsilon_closure and do a check in the
# the base condition, or something similar.
def single_epsilon_closure(node)
  return [] if node.epsilon == []
  node.epsilon + epsilon_closure(node.epsilon)
end

def epsilon_closure(nodes)
  nodes.each do |node|
    nodes += single_epsilon_closure(node)
  end
  return nodes.uniq
end

