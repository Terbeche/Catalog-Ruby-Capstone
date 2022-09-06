require 'io/console'
require_relative 'book'
require_relative 'label'
require_relative 'item'

require_relative './persist_files/persist_books'
require_relative './persist_files/persist_labels'

class App
  def initialize
    @books = load_books
    @labels = load_labels
  end

  include BooksPersistence
  include LabelsPersistence

  def menu
    puts
    puts '               Welcome to our catalog!'
    puts '------------------------------------------------------------------------------'
    puts '  | 1 |     List all books                                |'
    puts
    puts '  | 2 |     List all labels                               |'
    puts
    puts '  | 3 |     Create a book                                 |'
    puts
    puts '  | 4 |     Exit                                          |'
    puts '------------------------------------------------------------------------------'
  end

  def check(options)
    case options
    when 1
      list_books
    when 2
      list_labels
    when 3
      add_book
    end
  end

  def execute
    choice = 0
    while choice != 4
      menu
      puts
      puts
      print 'Please Choose Your Option [1-4]: '
      choice = gets.chomp.strip.to_i
      puts
      puts
      check(choice)

      puts
      puts
    end

    store_books(@books)
    store_labels(@labels)
    puts 'Thank you for using our app !'
  end

  def list_books
    if @books.empty?
      puts 'There is no books to display'
    else
      puts 'Here is the list of books'
      puts
      @books.each_with_index do |book, index|
        puts "#{index}) Publisher: \"#{book.publisher}\", Publish Date: #{book.publish_date}"
      end
    end
  end

  def add_book
    print 'Publisher: '
    publisher = gets.chomp.strip
    print 'What is the book\'s cover state: '
    cover_state = gets.chomp.strip
    print 'Publish_date: '
    publish_date = gets.chomp.strip
    print 'Is the book archieved or not? [Y/N]: '
    archived = gets.chomp.strip.upcase
    case archived
    when 'Y'
      archived = true
    when 'N'
      archived = false
    end
    print 'Please give a label name to your book: '
    title = gets.chomp.strip
    print 'Please give a label color: '
    color = gets.chomp.strip
    @labels.push(Label.new(title, color))
    @books.push(Book.new(rand(1000), publisher, cover_state, publish_date, archived))
  end

  def list_labels
    if @labels.empty?
      puts 'There is no labels to display'
    else
      puts 'Here is the list of labels'
      puts
      @labels.each_with_index do |label, index|
        puts "#{index}) Label name: \"#{label.title}\""
      end
    end
  end
end
