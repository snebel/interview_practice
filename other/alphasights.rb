# Collapse the log by date into an array of hashes containing one entry per day
#
# [
#   {time: 201201, x: 2, y: 7, z: 2},
#   {time: 201202, a: 3, b: 4, c: 0},
# ]


log = [
  {time: 201201, x: 2},
  {time: 201201, y: 7},
  {time: 201201, z: 2},
  {time: 201202, a: 3},
  {time: 201202, b: 4},
  {time: 201202, c: 0}
]

log = log.map do |t|
  log.select{|h| h[:time] == t[:time]}.reduce(:merge)
end.uniq