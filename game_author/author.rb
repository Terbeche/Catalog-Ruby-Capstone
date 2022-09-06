require './item'

class Author
  attr_reader :items, :id
  attr_accessor :first_name, :last_name
  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item_class)
    items << item_class
  end
end
