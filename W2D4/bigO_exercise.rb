def sluggish_octopus(arr)
  arr.length.times do |i|
    longest = true

    arr.length.times do |j|
      next if i == j
      if arr[i].length < arr[j].length
        longest = false
      end
    end

    return arr[i] if longest == true
  end
end

p sluggish_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def clever_octopus(arr)
  longest = ''
  
  arr.length.times do |i|
    if arr[i].length > longest.length
      longest = arr[i]
    end
  end
  
  return longest
end

p clever_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])