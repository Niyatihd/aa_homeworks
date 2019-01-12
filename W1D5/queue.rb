class Queue #FIFO
  attr_reader :queue
  
  def initialize(queue=[])
    @queue = queue
  end
  
  def enqueue(el)
    queue.unshift(el)
  end
  
  def dequeue
    queue - [queue.pop]
  end
  
  def peek
    queue.last
  end
  
  # private
  
  # attr_reader :queue

end

if __FILE__ == $PROGRAM_NAME
  cafe_queue = Queue.new
  cafe_queue.enqueue("Abby")
  cafe_queue.enqueue("Raul")
  cafe_queue.enqueue("Manalo")
  cafe_queue.enqueue("Shay")
  print "Current people in queue at cafe Barista are #{cafe_queue.queue}\n"
  cafe_queue.dequeue
  print "Updated queue at cafe Barista is #{cafe_queue.queue}\n"
  print "Next in queue at cafe Barista is #{cafe_queue.peek}\n"
end