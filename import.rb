require './shipment'
require 'pry'

puts "ohai"

shipments = []

money = 0
fry_bonus = 0
amy_bonus = 0
bender_bonus = 0
leela_bonus = 0

open("planet_express_logs.csv").each do |line|

  values_array = line.chomp.split(",")

  shipment = Shipment.new
  shipment.destination      = values_array[0]
  shipment.what_got_shipped = values_array[1]

  # binding.pry  # => Stop here


  shipment.how_many         = values_array[2].to_i
  shipment.money            = values_array[3].to_i

  money += shipment.money

  case shipment.destination
  when "Earth"
    fry_bonus += shipment.money * 0.10
  when "Mars"
    amy_bonus += shipment.money * 0.10
  when "Uranus"
    bender_bonus += shipment.money * 0.10
  else
    binding.pry
    leela_bonus += shipment.money * 0.10
  end

  shipments << shipment

end


puts "How much money did we make this week?"
puts "Money: #{money}"


# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one

puts "Fry: #{fry_bonus}"
puts "Amy: #{amy_bonus}"
puts "Bender: #{bender_bonus}"
puts "Leela: #{leela_bonus}"

puts "Shipments : #{shipments}"
#
# pizza = shipments.select do |shipment|
#   shipment.what_got_shipped == "Pizza"
# end
#
# puts "Total for pizza: #{pizza.map(&:money).inject(:+)}"
#
#
# fry = shipments.select do |shipment|
#   shipment.destination == "Earth"
# end
# puts "fry: #{fry.map(&:money).inject(:+) * 0.10}"
