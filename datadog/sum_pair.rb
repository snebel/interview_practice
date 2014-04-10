# In-Person Question 1 (whiteboard)
# Wite a method that, given an array of integers and a sum, returns a boolean that
# determines whether or not any two numbers in the array add to the sum.
# ex) sum_pair?([2,5,3,1], 6) => true, sum_pair?([2,5,3,1], 9) => false

def sum_pair?(arr, sum)
  for i in (0...arr.size-1)
    for j in (i...arr.size)
      return true if arr[i] + arr[j] == sum
    end
  end
  false
end

# Follow-Up Questions
# -Run-time complexity?
# -Can we optimize this using a hash to store desired values so that we don't have
#  to literally compare every two numbers?