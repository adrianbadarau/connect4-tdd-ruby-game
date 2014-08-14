class Board
  attr_accessor :bord
  def initialize
    @bord = [ [0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0]
    ]
  end

  def show
    @bord.each do |row|
      print row
      puts ''
    end

  end
end

class Player
  attr_accessor :name, :symbol
  def initialize(name, sym)
    @name = name
    @symbol = sym
  end
  def move(col, bord)
    i = 5
    while i >= 0 do
      if bord[i][col] == 0
        bord[i][col] = @symbol
        move = [i,col]
        return move
        break
      end
      i-=1
    end
    puts 'That row is full' if i < 0
    return bord
  end
  def win?(move, bord)
    rez = []
    win = [@symbol,@symbol,@symbol,@symbol]
    rez << check_left(move, bord)
    rez << check_right(move, bord)
    rez << check_down_left(move, bord)
    rez << check_down_right(move, bord)
    rez << check_up_left(move, bord)
    rez << check_up_right(move, bord)
    rez.include?(win) ? true : false
  end

  def check_left(move, bord)
    row = move[0]
    col = move[1]
    i = row
    j = col
    rez =[]
    rez << bord[i][j]
    3.times do
      j-=1
      if j < 0
        return rez
        break
      end
      rez << bord[i][j]
    end
    return rez
  end

  def check_right(move, bord)
    row = move[0]
    col = move[1]
    i = row
    j = col
    rez =[]
    rez << bord[i][j]
    3.times do
      j+=1
      if j > 6
        return rez
        break
      end
      rez << bord[i][j]
    end
    return rez
  end

  def check_down_right(move , bord)
    row = move[0]
    col = move[1]
    i = row
    j = col
    rez =[]
    rez << bord[i][j]
    3.times do
      i+=1
      j+=1
      if (i>5) or (j>6)
        return rez
        break
      end
      rez << bord[i][j]
    end
    return rez
  end
  def check_up_right(move, bord)
    col = move[1]
    row = move[0]
    i = row
    j = col
    rez =[]
    rez << bord[i][j]
    3.times do
      i-=1
      j+=1
      if (i < 0) and (j>6)
        return rez
        break
      end
      rez << bord[i][j]
    end
    return rez
  end
  def check_down_left(move, bord)
    row = move[0]
    col = move[1]
    i = row
    j = col
    rez =[]
    rez << bord[i][j]
    3.times do
      i-=1
      j-=1
      if j < 0 and i < 0
        return rez
        break
      end
      rez << bord[i][j]
    end
    return rez
  end
  def check_up_left(move, bord)
    row = move[0]
    col = move[1]
    i = row
    j = col
    rez =[]
    rez << bord[i][j]
    3.times do
      i-=1
      j-=1
      if i < 0
        return rez
        break
      end
      rez << bord[i][j]
    end
    return rez
  end
end

b = Board.new
puts '--- Game Starting ---'
#create player 1
printf 'Hello Player pls tell me your name: '
name = gets.chomp
puts ''
printf 'Pls choose a symbol: '
sym = gets.chomp.upcase
p1 = Player.new(name,sym)
puts ''
# Create player 2
printf 'Hello Playe2 pls tell me your name: '
name = gets.chomp
puts ''
printf 'Pls choose a symbol: '
sym = gets.chomp.upcase
p2 = Player.new name, sym
puts ''
tries = 42
while tries > 0 do
  b.show
  bord = b.bord
  puts "#{p1.name} make your move"
  chose_col = gets.chomp.to_i
  move = p1.move(chose_col,bord)
  if p1.win?(move,bord)
    puts "Congrats #{p1.name} YOU WIN !"
    break
  end
  b.show
  puts "#{p2.name} make your move"
  chose_col = gets.chomp.to_i
  move = p2.move(chose_col,bord)
  if p2.win?(move,bord)
    puts "Congrats #{p2.name} YOU WIN !"
    break
  end
  tries -=1
end



