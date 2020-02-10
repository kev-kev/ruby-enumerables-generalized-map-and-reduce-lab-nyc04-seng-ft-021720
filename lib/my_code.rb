# Your Code Here

def map(src_array)
  result = []
  src_array.each{ |item|
    result.push(yield(item))
  }
  result
end

# setting the starting_value to nil rather than 0,
# this is because you could pass any value to the method as a starting_value, 
# not just a number
def reduce(src_array, starting_value = nil)
  # if a truthy starting_value is provided, we set the running total/sum equal to it
  if starting_value
    sum = starting_value
    i = 0
  else
  # if the starting_value isn't provided or is falsy,
  # use the first item in the array as the starting point by setting it equal to the running total/sum
  # since we access the first item in the array to start, when we iterate over the array to reduce,
  # we need to set the index equal to one rather than zero, so it only adds the first item of the array once.
    sum = src_array[0]
    i = 1
  end
  # the first blocks being passed use {|memo, n| memo + n} to add to the first argument, so we need a method
  # that sets the running total equal to the yield of that block when passed the total and the next item 
  # in the array (src_array[i])
  # 
  # the next blocks being passed use {|memo, n| memo && n} to check if the 
  
  while i < src_array.length 
    sum = yield(sum, src_array[i])
    i += 1
  end
  sum
end