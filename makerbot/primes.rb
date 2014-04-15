# In person whiteboarding question:
# Print all the primes below 1,000

def primes_upto(limit)
  primes = [2]
  for n in (3..limit)
    primes << n if !primes.map{|p| n % p == 0}.reduce(:|)
  end
  primes
end

p primes_upto(1000)