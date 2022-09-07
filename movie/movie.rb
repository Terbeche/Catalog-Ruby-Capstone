require_relative 'item'

class Movie < Item
  attr_accessor :silent, :name

  def initialize(name, silent, publish_date, id = nil)
    super(id, publish_date)
    @silent = silent
    @name = name
  end

  private

  def can_be_archived?
    super || silent
  end
end