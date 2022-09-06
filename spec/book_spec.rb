require_relative '../book'

describe Book do
  before :each do
    @book = Book.new(1, 'mustapha', 'bad', '2022-09-05', false)
    @second_book = Book.new(5, 'mustapha', 'good', '2022-09-05', false)
    @third_book = Book.new(23, 'mustapha', 'good', '2010-06-05', false)
  end

  describe '#new' do
    it 'takes 5 parameters and returns a Book object' do
      expect(@book).to be_instance_of Book
    end
  end

  describe '#can_be_archived?' do
    it 'should return true when cover_state equals "bad" ' do
      expect(@book.can_be_archived?).to eql true
    end

    it 'should return false when cover_state is not equal to "bad" ' do
      expect(@second_book.can_be_archived?).to eql false
    end

    it 'should return true if published_date is older than 10 years' do
      expect(@third_book.can_be_archived?).to eql true
    end
  end
end
