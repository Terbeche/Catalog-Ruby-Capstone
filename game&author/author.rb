class Author
  def initialize(id, first_name, last_name, _items)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item_class)
    items << item_class
  end
end
