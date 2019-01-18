class LRUCache
  
  def initialize(size)
    @cache = Array.new(size)
    @size = size
    @hash = Hash.new(0)
  end
  
  def count
    cache.length
  end

  def add(el)
    remove_least_used? unless can_add_el?(size)
    @cache << el unless cache.include?(el)
    @hash[el] += 1
  end

  def show
    p @cache
    p @hash
  end

  
  # private
  def remove_least_used?
    min_val = @hash.values.min

    temp_hash = @hash.select { |k,v| v == min_val }
    key_to_be_removed = temp_hash.keys.first

    @cache.each do |el|
      @cache.delete(el) if el == key_to_be_removed
      return
    end
  end

  def can_add_el?(size)
    return true if count < size
  end

  # def remove_prev
  #   @cache.shift
  # end

  attr_reader :cache, :size
end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
#[5, [1,2,3], -5, {a: 1, b:2, c:3}]

# {5 => 1}

# "i walk the line", 