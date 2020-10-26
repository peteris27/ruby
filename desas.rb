class Game

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

  def initialize(board)
    @board = ['', '', '', '', '', '', '', '', '']
  end

  def show_board()
    puts "Spele krustini un nullites\n\n"
    puts (" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts ("-----------")
    puts (" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts ("-----------")
    puts (" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
    puts "\n"
  end

  def player_first(x)
    show_board()
    print "Speletaj 'X', ievadi lauku, kura gribi ielikt krustinu. (cipari no 1-9): "

    @x = x
    x = gets.chomp.to_i
    value = true if (x >= 1 && x <= 9 && @board[x-1].empty?)

    while (value != true)
      print "Speletaj 'X', tu ievadiji nepareizu skaitli vai tavs lauks ir aiznemts. Raksti ciparu no 1-9: "
      x = gets.chomp.to_i
      break if (x >= 1 && x <= 9 && @board[x-1].empty?)
    end

    @board[x-1] = "X"

  end

  def player_second(o)
    show_board()
    print "Speletaj '0', ievadi lauku, kura gribi ielikt nulliti. (cipari no 1-9): "

    @o = o
    o = gets.chomp.to_i
    value = true if (o >= 1 && o <= 9 && @board[o-1].empty?)

    while (value != true)
      print "Speletaj '0', tu ievadiji nepareizu skaitli vai tavs lauks ir aiznemts. Raksti ciparu no 1-9: "
      o = gets.chomp.to_i
      break if (o >= 1 && o <= 9 && @board[o-1].empty?)
    end

    @board[o-1] = "0"

  end

  def game_process

    times = 0

    while (times < 9)
      print "\033[2J\033[H"

      player_first(@x)

      break if (win_X() == true)

      times += 1

      break if times == 9

      print "\033[2J\033[H"

      player_second(@o)

      break if (win_0() == true)

      times += 1
    end

    print "\033[2J\033[H"
    show_board()

    if (win_X() == true)
      print "Spele beidzas! Un mums ir uzvaretajs! Uzvareja speletajs 'X'!\n\n"
    elsif (win_0() == true)
      print "Spele beidzas! Un mums ir uzvaretajs! Uzvareja speletajs '0'!\n\n"
    else
      print "Spele beidzas! Neviens neuzvareja!\n\n"
    end

  end

def win_X
  new_arr = []
  WIN_COMBINATIONS.map do |arr|
    arr.all? do |n|
      new_arr.push(@board[n] == 'X')
      n+= 1
    end
  end
  win_arr = new_arr.each_slice(3).to_a
  win_arr.each do |x|
    if x == [true, true, true]
      return true
    end
  end
end

def win_0
  new_arr = []
  WIN_COMBINATIONS.map do |arr|
    arr.all? do |n|
      new_arr.push(@board[n] == '0')
      n+= 1
    end
  end
  win_arr = new_arr.each_slice(3).to_a
  win_arr.each do |x|
    if x == [true, true, true]
      return true
    end
  end
end

game = Game.new("")

game.game_process

end
