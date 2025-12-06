(local config (require "config"))
(local control (require "control"))
(local sprites (require "sprites"))
(local enemies {})


(fn spawn-enemy []
  (table.insert enemies {
   :x 0
   :y 25
   :bullets {}
  }))


(fn update-enemy [enemy]
  (set enemy.x (+ enemy.x 1)))

(fn update []
  (control.map update-enemy enemies))


(fn draw-enemy [enemy]
  (love.graphics.draw
    sprites.tileset
    (sprites.get 7 1)
    (- enemy.x config.hsize)
    (- enemy.y config.hsize)
    0 config.scale))

(fn draw []
  (control.map draw-enemy enemies))

{
 :spawn spawn-enemy
 :update update
 :draw draw
}
