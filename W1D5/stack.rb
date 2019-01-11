class Stack #LIFO
  attr_reader :stack

  def initialize(stack=[])
    @stack = stack
  end

  def push(el)
    stack << el
  end

  def pop
    stack - [stack.pop]
  end

  def peek
    stack.last
  end  
end

if __FILE__ == $PROGRAM_NAME
  new_stack = Stack.new 
  # new_stack.push(1).push(2).push(3).push(4)
  # p new_stack.stack
  # new_stack.pop
  # p new_stack.stack
  # p new_stack.peek
end