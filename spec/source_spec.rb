require './movies/source'
require './item'
describe Source do
  before :each do
    @source = Source.new('gift')
    @item = Item.new(27, '2021-07-12', false)
    @source.add_item(@item)
  end
  describe '#new' do
    it 'takes 1 parameters and returns a Source object' do
      expect(@source).to be_instance_of Source
    end
    it 'takes 3 parameters and returns a Item object' do
      expect(@item).to be_instance_of Item
    end
  end
  describe '#add_item' do
    it 'should return item to items collection' do
      expect(@source.items.length).to eql 1
    end
  end
end
