require_relative "../lib/scraper.rb"
require_relative "../lib/guitarist.rb"
require 'nokogiri'

class CLI

  def call
    puts ""
    puts "WELCOME TO ROLLING STONE'S 100 GREATEST GUITARISTS"
    puts ""
    puts "Enter 'info' for information about the list or 'exit' at any time to exit program"
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
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i >= 60 && i.to_i <= 79
          puts g
        end
      end
      puts ""
      read_more
      puts ""
    when "41-60"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i >= 40 && i.to_i <= 59
          puts g
        end
      end
      puts ""
      read_more
      puts ""
    when "21-40"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i >= 20 && i.to_i <= 39
          puts g
        end
      end
      puts ""
      read_more
      puts ""
    when "1-20"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i <= 19
          puts g
        end
      end
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
    when "info"
      puts ""
      Scraper.print_info
      puts ""
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
      puts ""
      puts "ROCK ON!!"
      exit
    end
    puts ""
    print_list
  end


end
