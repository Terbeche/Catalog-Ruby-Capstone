class Item
  attr_writer :genre, :author, :source, :label

  def initialize(id, publish_date, archived)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  private

  attr_writer :id, :archived
end
