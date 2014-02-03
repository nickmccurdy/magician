# Require all of magician's stuff
# TODO Require these in a specific order to minimize issues with dependencies between files
lib_path = File.join(File.dirname(__FILE__), 'magician', '*.rb')
Dir[lib_path].each { |file| require file }
