def print_random_housie_ticekt
  grid = random_housie
  grid.each do |row|
    p row.join("       ")
  end  
end

def unsorted_lookup_range(i)
  lower_range = i == 1 ? 1 : (i-1)*10
  upper_range = (i*10) - 1
  (lower_range..upper_range).to_a.sort{ rand() - 0.5}
end

def random_housie
  rows = 3
  columns = 9
  numbers = []
  # A Grid which has housie boxes in 2-dimensional form.
  grid = Array.new(rows) { Array.new(columns) }

  # To generate 5 random slots for each row.
  row = []
  row[0] = (1..9).to_a.sort{ rand() - 0.5 }[0..4].sort
  row[1] = (1..9).to_a.sort{ rand() - 0.5 }[0..4].sort
  row[2] = (1..9).to_a.sort{ rand() - 0.5 }[0..4].sort
  all_rows = (row[0] + row[1] + row[2]).sort 

  1.upto(9) do |i|
    column_count = all_rows.count(i)
    numbers = unsorted_lookup_range(i)[0..column_count].sort
    0.upto(2) do |j|
      if !row[j].include?(i)
        grid[j][i - 1] = "X" 
      else
        grid[j][i - 1] =  numbers.shift   
      end
    end
  end

  return grid
end
