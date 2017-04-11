require_relative "../lib/scraper.rb"
require_relative "../lib/guitarist.rb"
require 'nokogiri'
require 'pry'
require 'colorize'

class CLI

  def call
    Scraper.scrape_names
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
      Guitarist.all.drop(80).each do |g|
        puts "#{g.rank}. #{g.name}".yellow.bold
      end
      puts ""
      read_more
      puts ""
    when "61-80"
      puts ""
      Guitarist.all.each_with_index do |g, i|
        if g.rank >= 61 && g.rank <= 80
          puts "#{g.rank}. #{g.name}".yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "41-60"
      puts ""
      Guitarist.all.each_with_index do |g, i|
        if g.rank >= 41 && g.rank <= 60
          puts "#{g.rank}. #{g.name}".yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "21-40"
      puts ""
      Guitarist.all.each_with_index do |g, i|
        if g.rank >= 21 && g.rank <= 40
          puts "#{g.rank}. #{g.name}".yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "1-20"
      puts ""
      Guitarist.all.each do |g|
        if g.rank >= 1 && g.rank <= 20
          puts "#{g.rank}. #{g.name}".yellow.bold
        end
      end
      puts ""
      read_more
      puts ""
    when "full"
      puts ""
      Guitarist.print_ranker
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
      guitarist = Guitarist.find(input.to_i - 1)
      Guitarist.assign_attributes(guitarist)
      Guitarist.shave_blurb(guitarist)
        puts ""
        puts ""
        puts "#{guitarist.rank}. #{guitarist.name}".green.bold
        puts ""
        puts guitarist.blurb.green.bold
        puts ""
        puts ""
        print_list
    else
      puts ""
      puts "INVALID ENTRY - TRY AGAIN".red.bold
      puts ""
      read_more
      puts ""
    end
  end

end
