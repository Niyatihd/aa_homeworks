require 'byebug'

def recursive_range(start_num, end_num)
  return [] if end_num < start_num
  return [start_num] if end_num == 2

  recursive_range(start_num, end_num - 1).push(end_num - 1)
end

def iterative_range(start_num, end_num)
  result = []

  (start_num...end_num).each { |num| result << num}
  result
end

def exp1(base, power)
  return 1 if power == 0
  base * exp1(base, power - 1)
end

def exp2(base, power)
  return 1 if power == 0

  if Integer(power).odd? 
    base * ((exp2(base, (power - 1)/ 2)) * (exp2(base, (power - 1)/ 2)))
  else
    (exp2(base, power / 2)) * (exp2(base, power/ 2))
  end
end

class Array
  def deep_dup(result = [])
    each do |el| 
      el.is_a?(Array) ? result.concat([el.deep_dup]) : result.push(el)
    end
    result
  end
end

# class Array
#   def deep_dup(result = [])
#     # result = []

#     each do |el| 
#       if el.is_a?(Array)
#         result.concat([el.deep_dup])
#       else
#         result.push(el)
#       end
#     end
#     result
#   end
# end

def rec_fibo(n)
  # byebug
  # temp = []
  return [1] if n == 1
  return [1,1] if n == 2
  rec_fibo(n-1) + [rec_fibo(n-1).last + rec_fibo(n-2).last]
end

def bsearch(arr, target)
  size = arr.length
  mid = size / 2 #1
  p mid
  # byebug
  if size < 1 
    return nil
  elsif target == arr[mid]
    return mid 
  elsif target > arr[mid]
    #if nil return nil or 
    bsearch(arr[(mid + 1)..-1], target) + mid
  else
    bsearch(arr[0...mid], target)
  end
end


class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << ((left.first < right.first) ? left.shift : right.shift)
    end

    merged_array + left + right
  end
end