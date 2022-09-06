require 'io/console'
require_relative 'book'
require_relative 'label'
require_relative './book_label/book_access'
require_relative './book_label/label_access'

LABEL = LabelAccess.new
BOOK = BookAccess.new
class App
  def initialize
    # @books = load_books
    # @labels = load_labels
  end

  # include BooksPersistence
  # include LabelsPersistence

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
      BOOK.list_books
    when 2
      LABEL.list_labels
    when 3
      BOOK.add_book
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
      check(choice)
      wait_continue if choice != 4
      puts
      puts
    end
    # store_books(@books)
    # store_labels(@labels)
  end

  def wait_continue
    print 'press any key to continue...'
    $stdin.getch
    print "             \r"
  end
end
