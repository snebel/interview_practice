# Phone Interview Question 1
# Write a method that finds the character in a string with the maximum number
# of consecutive repetitions.
# ex) find_char('aabbbaa') => 'b'

def find_char(str)
  max_char = str[0]
  streak = 1
  max_streak = 0

  for i in (1...str.size)
    str[i] == str[i-1] ? streak += 1 : streak = 1
    if streak > max_streak
      max_char = str[i]
      max_streak = streak
    end
  end
  max_char
end

# Follow Up Questions:
# -How would you test this method? Edge cases?
# -What's the run-time complexity?