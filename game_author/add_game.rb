require_relative 'game'

module AddGame
 def add_game
    print 'published Date: '
    published_date = gets.chomp.to_i

    print 'is Archived [Y/N]: '
    archived = ''

    case gets.chomp.downcase
    when 'y'
      archived = true

    when 'n'
      archived = false
    else
      puts('please enter [Y/N]: ')
    end

    print 'Multiplayer: '
    multiplayer = gets.chomp

    print 'last played at: '
    last_played_at = gets.chomp.to_i

    create_game(published_date, archived, multiplayer, last_played_at)
    # final_add(published_date, archived)
    run
 end

 def create_game(publish_date,archived,multiplayer, last_played_at)
    new_game = Game.new(publish_date, multiplayer, last_played_at, archived)
    @game << new_game
 end
 def final_add(published_date, archived)
    puts 'Authors'
    puts '0. Create new'
    @items.each_with_index do |author, i|
        puts "#{i + 1}. #{author.first_name} #{author.last_name}"
    end
    choice = ''
    
    case gets.chomp.to_i
    when  0
    print 'First name: '
    fn = gets.chomp

    print 'last name: '
    fl = gets.chomp
    new_author = Author.new(fn,fl)
    new_item = Item.new(publish_date,archived,new_author)
    run
    end 
    
 end
end