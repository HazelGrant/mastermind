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

  dup_guess.each_with_index do |peg, index| #this is not quite right
    if code[index] == peg
      result << " + "
      peg = "marked"
    elsif code.include?(peg)
      result << " - "
      peg = "marked"
    end
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