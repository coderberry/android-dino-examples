require "dino"

board = Dino::Board.new(Dino::TxRx.new)
led = Dino::Components::Led.new(pin: 12, board: board)

[:on, :off].cycle do |status|
  led.send(status)
  sleep 0.5 
end
