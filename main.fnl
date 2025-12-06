(love.graphics.setDefaultFilter "nearest")

(local enemies (require "enemies"))
(local player (require "player"))
(local sprites (require "sprites"))

(fn love.load []
  (love.graphics.setBackgroundColor 0.2 0.4 0.6)
  (enemies.spawn)
  (sprites.load))

(fn love.update []
  (player.update)
  (enemies.update))

(fn love.draw []
  (player.draw)
  (enemies.draw))
