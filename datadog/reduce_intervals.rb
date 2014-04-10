# In-Person Question 2 (whiteboard)
# Write a method that, given an array of intervals, e.g. [2,5] represents all numbers
# between 2 and 5, return an array of intervals representing the exact same intervals 
# in such a way that no two intervals overlap.
# ex) reduce_intervals([[8,10], [2,5], [3,6]]) => [[8,10], [2,6]]

def reduce_intervals(arr)
  # major optimization here is to sort the intervals first. This way,
  # we know if an interval doesn't overlap with the next one, it won't
  # overlap with any others down the line
  arr.sort_by!{|a| a[0]}
  new_arr = []
  i = 0
  for i in(0...arr.size)
    if arr[i+1] && overlap?(arr[i], arr[i+1])
      arr[i+1] = merge(arr[i], arr[i+1])
    else
      new_arr << arr[i]
    end
  end
  new_arr
end

def overlap?(int1, int2)
  int1[1] >= int2[0] ? true : false
end

def merge(int1, int2) [1,6][2,3]
  int1[1] > int2[1] ? int1 : [int1[0], int2[1]]
end
