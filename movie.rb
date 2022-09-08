require_relative 'item'

class Movie < Item
  attr_accessor :silent, :name
  attr_reader :id, :publish_date, :archived

  def initialize(id, name, silent, publish_date, archived, source)
    super(id, publish_date, archived)
    @silent = silent
    @name = name
    @source_name = source
  end

  def can_be_archived?
    super || silent == true
  end
end
