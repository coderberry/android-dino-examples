require "dino"

LED_PIN = 12
BUTTON_PIN = 2

board = Dino::Board.new(Dino::TxRx.new)
led = Dino::Components::Led.new(pin: LED_PIN, board: board)
button = Dino::Components::Button.new(board: board, pin: BUTTON_PIN)

button.up do
  puts "Pressed"
  led.on
end

button.down do
  puts "DOWN"
  led.off
end

led.off

puts "Press the button to turn on the LED... (Ctrl+C to exit)"

sleep
