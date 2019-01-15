class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...cups.length).each do |i| 
      unless i == 6 || i == 13
        4.times do
          cups[i] += [:stone]
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    ending_cup_idx = start_pos + 1
    until stones.empty?
      
      if current_player_name == name1
        @cups[ending_cup_idx] += [stones.pop] unless ending_cup_idx == 13
      else
        @cups[ending_cup_idx] += [stones.pop] unless ending_cup_idx == 6
      end
      
      ending_cup_idx = (ending_cup_idx + 1) % cups.length unless stones.empty?
      # stones.pop will not work as it will pop the stone @ idx 13 and 6 too which we do not want
    end

    render
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch,
    #  :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? { |el| el == [] } || cups[7..12].all? { |el| el == [] }
  end

  def winner
    result = cups[6].length <=> cups[13].length
    case result
    when 0
      return :draw
    when 1
      return name1
    when -1
      return name2
    end
  end
end
