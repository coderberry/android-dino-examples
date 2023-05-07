require "dino"
require "./rgb_mapping.rb"

SOUND_SENSOR_PIN = "A0".freeze

board = Dino::Board.new(Dino::TxRx.new)
sound_sensor = Dino::Components::Sensor.new(pin: SOUND_SENSOR_PIN, board: board)

on_data = Proc.new do |data|
  puts "Sound sensor value: #{data}"
end

sound_sensor.when_data_received(&on_data)

sleep
