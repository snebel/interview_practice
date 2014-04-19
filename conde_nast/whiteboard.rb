# These two questions were language agnostic, but I wrote solutions in Ruby

# (1) Say we have an array of objects [a, b, c,...], where each object has children,
#     e.g., a.children => [a1, a2], and each child also has children, etc.
#     Write a method that takes an array of objects and an integer depth and returns
#     an array of the following form 'depth' number of levels deep
#     [{
#       id: a,
#       children: [
#         {
#           id: a1
#           children: [{...}, {...}, ...]
#         },
#         {
#           id: a2,
#           children: [{...}, {...}, ...] 
#         },
#       ]
#      },
#      {
#        id: b,
#        .
#        .
#        .
#     }]
def hydrate(arr, depth)
  return [] if depth == 0
  arr.map do |a|
    {id: a, children: hydrate(a.children, depth-1)}
  end
end


# (2) Say we have a big array of objects (hashes), e.g. the results from a mongodb
#     database call. Each hash has an id property, but the ids don't have any natural
#     ordering. Write a method that takes in an array of objects and an array of ids,
#     and efficiently sorts the objects so that their order matches the order of the ids.
#     hint: a big array of objects is a bad data structure for look-up time and we aren't
#     concerned about memory.
def sort(objects, ids)
  dict = {}
  objects.each{|obj| dict[obj.id] = obj}
  return ids.map{|id| dict[id]}
end