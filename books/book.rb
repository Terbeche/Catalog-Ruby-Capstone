require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id, :publish_date, :archived

  # rubocop:disable Metrics/ParameterLists
  def initialize(id, publisher, cover_state, publish_date, archived, label)
    super(id, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?()
    super || cover_state == 'bad'
  end
end
