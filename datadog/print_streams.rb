# Phone Interview Question 2
# A "stream" is a datatype consisting of an infinite stream of increasing integers.
# Each time '.read' is called on a stream, it returns the next integer in the stream,
# i.e., the 3rd time read is called on a certain stream it will give you the 3rd
# number in that stream, but there is no longer a way to read the previous two numbers.
#
# Write a method that takes an array of streams and prints the values of all the
# streams in an increasing order. ex) 
# s1 = 1, 3, 5, 8, 10...
# s2 = 1, 4, 5, 6, 12...
# s3 = 3, 7, 7, 8, 9, 15...
# f([s1, s2, s3]) => 1, 1, 3, 3, 4, 5, 5, 6, 7, 7...

def print_streams(streams)
  vals = steams.map{|s| s.read}
  while true
    min = vals.min
    i = vals.index(min)
    p min
    vals[i] = streams[i].read
  end
end

# Follow Up Questions:
# -Walk me through this algorithm.
# -Run-time complexity?