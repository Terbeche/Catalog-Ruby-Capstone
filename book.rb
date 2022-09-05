require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, id, publish_date, _archived)
    super(id, publish_date, archived = false)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?()
    super || cover_state == 'bad' ? true : false
  end
end
