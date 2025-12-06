(local sprites (require "sprites"))
(local control (require "control"))
(local config (require "config"))

(local (w h) (love.window.getMode))

(local normalizer (control.normalizer 1 1))
(local bullet-speed 8)

(global player {
  :x (- (/ w 2) (/ config.size 2))
  :y (- (/ h 2) (/ config.size 2))
  :speed 2
  :speed-slow 1

  :reload-total 15
  :reload 90
})


(local bullets {})


(fn update-movement []
  (let [axis-x (- (control.bool-to-int (control.key "right" "d" "l"))
                  (control.bool-to-int (control.key "left" "a" "h")))
        axis-y (- (control.bool-to-int (control.key "down" "s" "j"))
                  (control.bool-to-int (control.key "up" "w" "k")))]

    (let [sp (* (if (control.key "z" "n") player.speed-slow player.speed)
                (if (or (= axis-x 0) (= axis-y 0)) 1 normalizer.x))]
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
           (control.key "z" "n" "c" ","))
    (do (set player.reload player.reload-total)
        (shoot))))

(fn update-bullet [bullet]
  (set bullet.y (- bullet.y bullet-speed)))

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
   (- bullet.x config.hsize)
   (- bullet.y config.hsize)
   0 config.scale))

(fn draw-bullets []
  (control.map draw-bullet bullets))


(fn draw []
  (draw-bullets)
  (love.graphics.draw
   sprites.tileset
   (sprites.get 1 4)
   (- player.x config.hsize)
   (- player.y config.hsize)
   0 config.scale))


{
 :update update
 :draw draw
}
