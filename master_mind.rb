# ## SIMPLIFY ## #

# A procedural first draft of Mastermind, implemented in Ruby for The Odin Project.

turn = 0

puts "Welcome to Mastermind!"
puts "I am going to think of a 4-digit number."
puts "It can be anything from 0000 to 6666."
puts "Your job is to guess the number."

code = []

4.times do 
  code.push(rand(0..6).to_s)
end

puts "I have generated the code!"

while turn < 12
  puts "Now take a guess!"

  guess = gets.chomp
  guess = guess.split("")

  if guess.length != 4 || guess.any? { |n| n.to_i > 6 }
    puts "Please enter four numbers between 0 and 6 with no spaces, such as: 5432."
    guess = gets.chomp
    guess= guess.split("")
  end

  dup_guess = guess.dup 

  result = []
  correct_color = 0
  black = 0
  white = 0

  guess_duplicates = Hash.new(0)
  guess.each { |e| guess_duplicates[e] += 1 }

  code_duplicates = Hash.new(0)
  code.each { |e| code_duplicates[e] += 1 }

  code_duplicates.each do |key, value|
    if guess_duplicates.has_key?(key)
      if guess_duplicates[key] > code_duplicates[key]
        correct_color += code_duplicates[key].to_i
      elsif guess_duplicates[key] < code_duplicates[key]
        correct_color += guess_duplicates[key].to_i
      elsif guess_duplicates[key] == code_duplicates[key]
        correct_color += guess_duplicates[key].to_i
      end
    end
  end

  counter = 0

  while counter < guess.length
    if guess[counter] == code[counter]
      black += 1
    end
    counter += 1
  end

  white = correct_color - black

  white.times do
    result.push(" - ")
  end

  black.times do 
    result.push(" + ")
  end

  puts result.shuffle.join(" ")

  if guess == code
    puts "You cracked the code in #{turn} turns!"
    puts code.join(" ")
    break
  elsif turn == 11 && guess != code
    puts "You failed to break the code!"
    puts "Good try."
    puts "It was " + code.join(" ")
  end

  turn += 1
  result = []
end