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