require_relative '../source'

module SourceModule
  def list_sources
    if @sources.empty?
      puts 'There is no source to display'
    else
      puts 'Here is the list of sources of movies'
      puts
      @sources.each_with_index do |source, index|
        puts "#{index}) \"#{source.name}\""
      end
    end
  end
end
