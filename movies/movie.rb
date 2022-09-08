require_relative '../item'

class Movie < Item
  attr_accessor :silent, :name, :source_name
  attr_reader :id, :publish_date, :archived

  # rubocop:disable Metrics/ParameterLists
  def initialize(name, silent, publish_date, archived, source, id)
    super(publish_date, archived, id)
    @silent = silent
    @name = name
    @source_name = source
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    super || silent == true
  end
end
