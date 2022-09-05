require 'date'
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
    (Date.today.year - Date.parse(@publish_date).year).to_i > 10
  end

  attr_writer :id, :archived
end
