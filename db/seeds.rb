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
puts "========== Seeded #{Device.count} Devices ==========\n\n"

puts "========== Seeding Tester & Devices =========="
CSV.foreach(Rails.root.join('db', 'seeds', 'tester_device.csv'), headers: true) do |row|
  Tester.find(row['tester_id']).devices << Device.find(row['device_id'])
end
puts "========== Seeded Tester & Devices ==========\n\n"

puts "========== Seeding Bugs =========="
CSV.foreach(Rails.root.join('db', 'seeds', 'bugs.csv'), headers: true) do |row|
  Bug.create! row.to_h
end
puts "========== Seeded #{Bug.count} Bugs ==========\n\n"

puts "Seeding completed successfully! Good job! 🚀 \n"
