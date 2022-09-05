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

  private

  def can_be_archived?
    publish_date > 10
  end

  attr_writer :id, :archived
end
