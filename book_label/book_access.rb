require_relative '../book'

class BookAccess
  @books = []

  def list_books
    if @books.empty?
      puts 'There is no books to display'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Publisher: \"#{book.publisher}\", Publish Date: #{book.publish_date}"
      end
    end
  end

  def add_book
    puts
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

    @books.push(Book.new(publisher, cover_state, id, publish_date, archived))
  end
end
