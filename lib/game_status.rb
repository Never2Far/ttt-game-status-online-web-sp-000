# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row (horizontal)
  [6,7,8],  # Bottom row
  [0,3,6],  # Left Column
  [1,4,7],  # Middle Column
  [2,5,8],  # Right Column
  [0,4,8],  # Diagonal 1 (negative slope)
  [2,4,6]   # Diagonal 2 (positive slope)
]


def won?(board)

  exes = board.each_index.select{ |i| board[i] == "X"}
  ohs = board.each_index.select{ |i| board[i] == "O"}

  experms = exes.permutation(3).to_a
  ohperms = ohs.permutation(3).to_a
  x_winning_index = WIN_COMBINATIONS.detect{ |win_combo| experms.include?(win_combo) }
  o_winning_index = WIN_COMBINATIONS.detect{ |win_combo| ohperms.include?(win_combo) }


  if (!!x_winning_index && !!o_winning_index)
    return false
  elsif x_winning_index
       return x_winning_index
  elsif o_winning_index
       return o_winning_index
    end
  end

def full?(board)
return board.none? {|i| (i == " ") || (i == "")}
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
if full?(board) || won?(board) || draw?(board)
  return true
else
  return false
end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  #elsif won?(board)[0] == "O"
    #return "O"
  #elsif won?(board)[0] == "X"
else
    return nil
  end
end