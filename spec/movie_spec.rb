require_relative '../movie'
describe Movie do
  before :each do
    @source = Source.new('new')
    @movie = Movie.new(1, 'krish', true, '2022-09-05', false, 'Gift')
    @second_movie = Movie.new(5, 'mr.bean', false, '2022-09-05', false, 'Gift')
    @third_movie = Movie.new(23, 'Snitch', false, '2010-06-05', false, 'Gift')
    @movie.add_source(@source)
  end
  describe '#new' do
    it 'takes 5 parameters and returns a Movie object' do
      expect(@movie).to be_instance_of Movie
    end
  end
  describe '#can_be_archived?' do
    it 'should return true when silent equals true ' do
      expect(@movie.can_be_archived?).to eql true
    end
    it 'should return false when silent equals false ' do
      expect(@second_movie.can_be_archived?).to eql false
    end
    it 'should return true if published_date is older than 10 years' do
      expect(@third_movie.can_be_archived?).to eql true
    end
  end
  describe '#add_source' do
    it 'should add source to item ' do
      expect(@movie.source.items.length).to eql 1
    end
  end
end
