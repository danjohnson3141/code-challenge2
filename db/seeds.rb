# encoding: UTF-8
Bullet = "\u2022"

if Rails.env != "test"
  puts "\n#{Bullet} Seeding Database:".green
  puts '--------------------------------------------------------------------------------------------'.green
  Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
end

puts '--------------------------------------------------------------------------------------------'.green
puts "Seeding complete"