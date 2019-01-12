class Mymap
  attr_reader :map_array
  
  def initialize(arr=[])
    @map_array = arr
  end

  def set(key, val)
    if @map_array.flatten.include?(key)
      @map_array.each_with_index do |el, i|
        el[1] = val if el[0] == key
      end
    else
      @map_array << [key, val]
    end
  end

  def get(key)
    result = nil
    @map_array.each { |el| result = el[1] if el[0] == key }
    result
  end
  
  def delete(key)
    @map_array.reject! { |el| el[0] == key }
  end

  def show
    print "#{@map_array}\n"
  end

end


if __FILE__ == $PROGRAM_NAME
  new_map = Mymap.new
  new_map.set("Dog", "Cocoa")
  new_map.set("Cat", "Garfield")
  new_map.set("Mouse", "Jerry")
  new_map.set("Deer", "Rudolph")
  new_map.set("Bear", "Pooh")
  # new_map.show
  new_map.set("Mouse", "Nibbles")
  # new_map.show
  new_map.delete("Cat")
  # new_map.show
  p new_map.get("Bear")
  # new_map.show
end