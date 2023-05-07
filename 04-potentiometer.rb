require "dino"

LED_PIN = 11
POTENTIOMETER_PIN = "A0".freeze

board = Dino::Board.new(Dino::TxRx.new)
led = Dino::Components::Led.new(pin: LED_PIN, board: board)
potentiometer = Dino::Components::Sensor.new(pin: POTENTIOMETER_PIN, board: board)

potentiometer.when_data_received do |data|
  led_level = (data.to_f / 1023.0 * 255.0).to_i
  led.send(:analog_write, LED_PIN, led_level)
end

sleep
