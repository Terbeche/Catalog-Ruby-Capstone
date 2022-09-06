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
        print "#{index}) Publisher: \"#{book.publisher}\", Publish Date: \"#{book.publish_date}\","
        print " Cover state: \"#{book.cover_state}\",  Archived: \"#{book.archived}\" , Label: \"#{book.title}\""
        puts
      end
    end
  end

  # rubocop:disable Metrics/MethodLength
  def add_book
    print 'Publisher: '
    publisher = gets.chomp.strip
    print 'Is the book\'s cover state good or bad ? [G/B]: '
    cover_state = gets.chomp.strip.upcase
    case cover_state
    when 'G'
      cover_state = 'good'
    when 'B'
      cover_state = 'bad'
    end
    print 'Enter publish date in [yyyy-mm-dd] format: '
    publish_date = gets.chomp.strip
    print 'Please give a label name to your book: '
    title = gets.chomp.strip.upcase
    print 'Please give a color to your label: '
    color = gets.chomp.strip.upcase
    label = Label.new(title, color)
    book = Book.new(rand(1000), publisher, cover_state, publish_date, false, title)

    book.move_to_archive
    book.add_label(label)
    label.add_item(book)
    @books << book
    @labels << label

    puts 'Book created successfully'
  end
  # rubocop:enable Metrics/MethodLength

  def list_labels
    if @labels.empty?
      puts 'There is no labels to display'
    else
      puts 'Here is the list of labels'
      puts
      @labels.each_with_index do |label, index|
        puts "#{index}) \"#{label.title}\""
      end
    end
  end
end
