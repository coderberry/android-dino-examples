#
# Example 1: Controlling an LED
#

require "bundler/setup"
require "dino"

LED_PIN = 11

board = Dino::Board.new(Dino::TxRx.new)
led = Dino::Components::Led.new(pin: LED_PIN, board: board)
led.send(:analog_write, LED_PIN, 0)

def set_brightness(led, brightness)
  led.send(:analog_write, LED_PIN, brightness)
  sleep 0.005
end

loop do
  0.upto(255).each do |b1|
    puts "A: Brightness: #{b1}"
    set_brightness(led, b1)
  end
  255.downto(0).each do |b2|
    puts "B: Brightness: #{b2}"
    set_brightness(led, b2)
  end
  puts "----"
  sleep 0.005
end