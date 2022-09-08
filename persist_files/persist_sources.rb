require 'json'

module sourcesPersistence
  def store_sources(sources)
    data = []
    file = './JSON_files/sources.json'
    return unless File.exist?(file)

    sources.each do |source|
      data << { name: source.name}
    end
    File.write(file, JSON.generate(data))
  end

  def load_sources
    data = []
    file = './JSON_files/sources.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |source|
      data << Source.new(source['name'])
    end
    data
  end
end