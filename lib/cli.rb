require_relative "../lib/scraper.rb"
require_relative "../lib/guitarist.rb"
require 'nokogiri'

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
    puts "1-20   21-40   41-60   61-80   81-100"
    puts ""
    input = gets.strip.downcase
    case input
    when "81-100"
      puts ""
      Scraper.create_ranker.drop(80).each do |guitarist|
        puts guitarist
      end
      puts ""
      read_more
      puts ""
    when "61-80"
      puts ""
      Scraper.create_ranker.each_with_index do |i, g|
        if i.to_i >= 62 && i.to_i <= 81
          puts g
        end
      end
      puts ""
      read_more
      puts ""
    when "41-60"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "21-40"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "1-20"
      puts ""
      puts "that stuff"
      puts ""
      read_more
      puts ""
    when "full"
      puts ""
      Scraper.print_ranker
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
    if input == "exit"
      exit
    end
    #printed full list will have numbers which equal array index +1 of full info list (an array of hashes)
    #calls info array with input number as element
    #add exit here as well
    puts ""
    print_list
  end


end
