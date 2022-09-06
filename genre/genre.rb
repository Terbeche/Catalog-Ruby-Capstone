class Genre
    attr_accessor :items, :name, :id
  
    def initialize(name, id = nil)
      @name = name
      @id = id || Random.rand(1..100)
      @items = []
    end
  
    
  end