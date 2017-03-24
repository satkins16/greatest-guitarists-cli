require_relative "../lib/scraper.rb"
require_relative "../lib/guitarist.rb"
require 'nokogiri'
require 'pry'
require 'colorize'

class CLI

  def call
    puts ""
    puts "-------------- WELCOME TO ROLLING STONE'S 100 GREATEST GUITARISTS --------------".yellow.bold
    puts ""
    puts ""
    puts "                                   ♪＼(^o^)／♪".yellow.bold
    puts ""
    puts ""
    puts "--------------------------------------------------------------------------------".yellow.bold
    puts ""
    sleep(1.5)
    puts "Enter 'info' for information about the list or 'exit' at any time to exit program"
    puts ""
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
        puts guitarist.yellow.bold
      end
      puts ""
      read_more
      puts ""
    when "61-80"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i >= 60 && i.to_i <= 79
          puts g.yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "41-60"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i >= 40 && i.to_i <= 59
          puts g.yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "21-40"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i >= 20 && i.to_i <= 39
          puts g.yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "1-20"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        if i.to_i <= 19
          puts g.yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "full"
      puts ""
      Scraper.create_ranker.each_with_index do |g, i|
        puts g.yellow.bold
      end
      puts ""
      read_more
      puts ""
    when "exit"
      puts ""
      puts "ROCK ON!!".red.bold
      puts ""
      exit
    when "info"
      puts ""
      Scraper.print_info
      puts ""
      puts ""
      sleep(1)
      print_list
      puts ""
    else
      puts ""
      puts "INVALID ENTRY - TRY AGAIN".red.bold
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
      puts "ROCK ON!!".red.bold
      puts ""
      exit
    elsif input.to_i >= 1 && input.to_i <= 100
      Guitarist.all.each do |guitarist|
        if input.to_i == guitarist.rank
          puts ""
          puts ""
          puts "#{guitarist.rank}. #{guitarist.name}".green.bold
          puts ""
          puts guitarist.blurb.green.bold
          puts ""
          puts ""
          print_list
        end
      end
    else
      puts ""
      puts "INVALID ENTRY - TRY AGAIN".red.bold
      puts ""
      read_more
      puts ""
    end
  end

end
