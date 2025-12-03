(love.graphics.setDefaultFilter "nearest")

(local sprites (require "sprites"))
(local player (require "player"))

(fn love.load []
  (sprites.load))

(fn love.update []
  (player.update))

(fn love.draw []
  (player.draw))
