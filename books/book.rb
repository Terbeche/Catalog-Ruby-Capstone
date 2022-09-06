require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :title
  attr_reader :id, :publish_date, :archived

  # rubocop:disable Metrics/ParameterLists
  def initialize(id, publisher, cover_state, publish_date, archived, title)
    super(id, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
    @title = title
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?()
    super || cover_state == 'bad'
  end
end
