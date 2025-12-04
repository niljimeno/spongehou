(local sprites (require "sprites"))
(local control (require "control"))

(local (w h) (love.window.getMode))

(local scale 3)
(local size (* 16 scale))

(local hsize (/ size 2)) ;; for drawing calculations
(local normalizer (control.normalizer 1 1))

(global player {
  :x (- (/ w 2) (/ size 2))
  :y (- (/ h 2) (/ size 2))
  :speed 1.6
  :speed-slow 1

  :reload-total 15
  :reload 90
})


(local bullets {})


(fn update-movement []
  (let [axis-x (- (control.bool-to-int (control.key "right" "l"))
                  (control.bool-to-int (control.key "left" "h")))
        axis-y (- (control.bool-to-int (control.key "down" "j"))
                  (control.bool-to-int (control.key "up" "k")))]

    (let [sp (* (if (control.key "z") player.speed-slow player.speed)
                (if (or (= axis-x 0) (= axis-y 0)) 1 normalizer))]
      (set player.x (+ player.x (* axis-x sp)))
      (set player.y (+ player.y (* axis-y sp))))))


(fn shoot []
  (table.insert bullets {
    :x player.x
    :y player.y
  }))

(fn update-shots []
  (set player.reload (- player.reload 1))
  (if (and (<= player.reload 0)
           (control.key "z" "c"))
    (do (set player.reload player.reload-total)
        (shoot))))

(fn update-bullet [bullet]
  (set bullet.y (- bullet.y 3)))

(fn update-bullets []
  (control.map update-bullet bullets))


(fn update []
  (update-movement)
  (update-shots)
  (update-bullets))


(fn draw-bullet [bullet]
  (love.graphics.draw
    sprites.tileset
    (sprites.get 1 6)
    (- bullet.x hsize)
    (- bullet.y hsize)
    0 scale))

(fn draw-bullets []
  (control.map draw-bullet bullets))


(fn draw []
  (draw-bullets)
  (love.graphics.draw
    sprites.tileset
    (sprites.get 1 4)
    (- player.x hsize)
    (- player.y hsize)
    0 scale))

{
 :update update
 :draw draw
}
