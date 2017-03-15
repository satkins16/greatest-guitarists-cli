class CLI

  def call
    puts ""
    puts "WELCOME TO ROLLING STONE'S 100 GREATEST GUITARISTS"
    puts ""
    print_list
  end

  def print_list
    puts "Enter which section you would like to see or enter 'full' for full list:"
    puts "100-81   80-61   60-41   40-21   20-1"
    puts ""
    input = gets.strip
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
    end
  end


end
