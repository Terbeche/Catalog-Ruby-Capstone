require_relative '../label'
require_relative '../item'

class LabelAccess
  def list_labels
    if @items.empty?
      puts 'There is no labels to display'
    else
      @items.each_with_index do |item, index|
        puts "#{index}) Label name: \"#{item.label.title}\""
      end
    end
  end
end
