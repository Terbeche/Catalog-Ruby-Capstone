require_relative '../book'
require_relative '../item'

module BookModule
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
end
