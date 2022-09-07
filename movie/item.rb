require_relative 

class Item
  attr_writer :genre, :author, :source, :label

  def initialize(id, publish_date, archived)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  def move_to_archive()
    archived = true if can_be_archived? 
  end

  def add_source(source)
    @source = source
    source.add_item(self) unless @source.items.include?(self)
  end

  private

  def can_be_archived?
    publish_date > 10
  end

  attr_writer :id, :archived
end
