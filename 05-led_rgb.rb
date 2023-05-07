require "dino"
require "./rgb_mapping.rb"

RGB_PINS = { red: 10, green: 9, blue: 6 }
POTENTIOMETER_PIN = "A0".freeze

board = Dino::Board.new(Dino::TxRx.new)
rgb_led = Dino::Components::RgbLed.new(pins: RGB_PINS, board: board)
potentiometer = Dino::Components::Sensor.new(pin: POTENTIOMETER_PIN, board: board)

potentiometer.when_data_received do |pot_value|
  print "Potentiometer value: #{pot_value}   \r"
  rgb_led.send :analog_write, RGB_PINS[:red], map_red(pot_value.to_i)
  rgb_led.send :analog_write, RGB_PINS[:green], map_green(pot_value.to_i)
  rgb_led.send :analog_write, RGB_PINS[:blue], map_blue(pot_value.to_i)
end

sleep
