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
    when "80-61"
      puts ""
      puts "that stuff"
    when "60-41"
      puts ""
      puts "that stuff"
    when "40-21"
      puts ""
      puts "that stuff"
    when "20-1"
      puts ""
      puts "that stuff"
    when "full"
      puts ""
      puts "full list"
    when "exit"
      puts ""
      puts "ROCK ON!!"
      exit
    else
      puts ""
      puts "INVALID ENTRY"
      puts ""
      print_list
      puts ""
    end
  end


end
