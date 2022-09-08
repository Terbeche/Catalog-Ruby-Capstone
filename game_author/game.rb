require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :author
  attr_reader :publish_date, :archived

  def initialize(multiplayer, last_played_at, publish_date, archived, author)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
  end

  def can_be_archived?()
    super & last_played_at > 2
  end
end
