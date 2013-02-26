Dir.glob(File.expand_path(File.dirname(__FILE__)) + '/**/*.rb').each do |test|
  require(test)
end
