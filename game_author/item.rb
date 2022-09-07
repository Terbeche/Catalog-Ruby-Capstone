class Item
  attr_writer :genre, :source, :label
  attr_reader :id, :archived, :publish_date

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @archived = archived
    @publish_date = publish_date
  end

  def move_to_archive()
    archived = true if can_be_archived?
  end

  def author=(author)
    @author = author
    author.items.push(self)
  end

  private

  def can_be_archived?
    publish_date > 10
  end
end
