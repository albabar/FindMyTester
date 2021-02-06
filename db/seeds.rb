# frozen_string_literal: true

abort("Are you crazy?? You are trying to run seed on non-dev env!!!!?") unless Rails.env.development?

require 'csv'

puts "========== Seeding Testers =========="
CSV.foreach(Rails.root.join('db', 'seeds', 'testers.csv'), headers: true) do |row|
  Tester.create! row.to_h
end
puts "========== Seeded #{Tester.count} Testers ==========\n\n"

puts "========== Seeding Devices =========="
CSV.foreach(Rails.root.join('db', 'seeds', 'devices.csv'), headers: true) do |row|
  Device.create! row.to_h
end
puts "========== Seeded #{Device.count} Testers ==========\n\n"

puts "Seeding completed successfully! Good job! 🚀 \n"
