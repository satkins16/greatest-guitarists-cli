class CLI

  def call
    puts ""
    puts "WELCOME TO ROLLING STONE'S 100 GREATEST GUITARISTS"
    puts ""
    puts "Enter 'exit' at any time to exit program"
    puts ""
    sleep(1.5)
    print_list
  end

  def print_list
    puts "Enter the section you would like to see or type 'full' for full list:"
    puts "100-81   80-61   60-41   40-21   20-1"
    puts ""
    input = gets.strip.downcase
    case input
    when "100-81"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "80-61"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "60-41"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "40-21"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "20-1"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "full"
      puts ""
      puts "full list"
      puts ""
      read_more
      puts ""
    when "exit"
      puts ""
      puts "ROCK ON!!"
      exit
    else
      puts ""
      puts "INVALID ENTRY - TRY AGAIN"
      puts ""
      print_list
      puts ""
    end
  end

  def read_more
    puts "Enter the number of the guitarist you would like to read more about:"
    puts ""
    input = gets.strip.downcase
    #printed full list will have numbers which equal array index +1 of full info list (an array of hashes)
    #calls info array with input number as element
    puts ""
    print_list
  end


end
