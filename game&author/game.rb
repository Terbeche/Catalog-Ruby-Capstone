require './item'

class Game < Item
  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    item.can_be_archived? == true & last_played_at > 2
  end
end
