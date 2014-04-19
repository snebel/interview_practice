# My friends and I like to go into bars, buy cans of beer, and build a square pyramid
# out of the cans (a square pyramid is layers of square numbers of beer cans, e.g., 
# a layer of 9 cans on bottom, a layer of 4 cans in the middle, and 1 can on top.)
#
# Write a function that, given the cost of a can of beer and a total amount to spend,
# returns the height of the tallest possible pyramid that can be built.

def pyramid_height(cost, total)
  cans = total / cost
  i = 0
  sum = 0
  while sum + (i+1)**2 <= cans
    i += 1
    sum += i**2
  end
  i
end

# OR using formula for square pyramidal numbers

def pyramid_height(cost, total)
  cans = total / cost
  n = 0
  n += 1 while (n*(n+1)*(2*n+1)) / 6 <= cans
  n - 1
end