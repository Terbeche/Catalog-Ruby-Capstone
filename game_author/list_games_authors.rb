module ListGameAndAuthor
    def list_authors
        puts 'There are no Authors' if @items.length.zero?
    
        @items.each do |author|
         puts "Author: #{author.first_name} #{author.last_name}"
        end
    
        puts ''
        run
      end
      def list_games
        @game.each do |game|
         puts "#{game.id} #{game.multiplayer}"
        end
    
        puts ''
        run
      end
end