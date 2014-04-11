# The following questions were asked during a phone code-screen. The interviewer said this
# was a "blind" interview, meaning he knew nothing about me or my background.

# given: we can assume a Node class like this already exists
class Node
  attr_accessor :left, :right, :value
  def initialize(val)
    @value = val
  end
end

# Example Tree:
#     1   
#   /   \   
# 2       3   
#  \     /   
#   4   5   
#  / \ 
#  6 7 

# Question 1: write a method to print the values of a binary tree in preorder,
# meaning the root, the preorder of the left tree, the preorder of the right tree.
# example tree preorder: 1,2,4,6,7,3,5
def preorder(node)
  p node.value if node.value 
  preorder(node.left) if node.left
  preorder(node.right) if node.right
end

# Question 2: write a method to print the values of a binary tree in inorder,
# meaning the inorder of the left tree, the root, the inorder of the right tree.
# example tree inorder: 2,6,4,7,1,5,3
def inorder(node)
  inorder(node.left) if node.left
  p node.value if node.value
  inorder(node.right) if node.right
end

# Question 3: Given the following preorder and inorder of a tree, construct what
# this tree looks like by hand.
# preorder: 1 3 7 6 2 4 5 8
# inorder: 3 6 7 1 4 2 5 8

# template:
#          X
#        /   \
#      X       X
#    /  \     /  \
#   X    X   X    X
#  / \  / \ / \  / \
# X  X  X X X X  X  X

# answer:
#          1
#        /   \
#      3       2
#    /  \     /  \
#   X    7   4    5
#  / \  / \ / \  / \
# X  X  6 X X X  X  8

# Question 4: Program a generalized version of question 3, i.e., given
# only a preordering and inordering of a tree, construct and return the tree.
def make_tree(pre, inord)
  return if pre.size == 0
  root_node = Node.new(pre[0])
  idx = inord.index(pre[0])
  root_node.left = make_tree(pre[1..idx], inord[0...idx])
  root_node.right = make_tree(pre[idx+1...pre.size], inord[idx+1...inord.size])
  return root_node
end

p make_tree([1,3,7,6,2,4,5,8], [3,6,7,1,4,2,5,8]) # => answer tree above

