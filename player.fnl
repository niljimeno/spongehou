(local sprites (require "sprites"))
(local control (require "control"))

(local (w h) (love.window.getMode))
(local scale 6)
(local size (* 16 scale))

(global player-state {
  :x (- (/ w 2) (/ size 2))
  :y (- (/ h 2) (/ size 2))
  :speed 3
})

(fn boolToi [b]
  (if b 1 0))

(fn update []
  (let [axis-x (- (boolToi (control.key "right" "l"))
                  (boolToi (control.key "left" "h")))
        axis-y (- (boolToi (control.key "down" "j"))
                  (boolToi (control.key "up" "k")))]
    (set player-state.x (+ player-state.x (* axis-x player-state.speed)))
    (set player-state.y (+ player-state.y (* axis-y player-state.speed)))))

(fn draw []
  (love.graphics.draw
    (. sprites :tileset)
    ((. sprites :get) 1 4)
    (. player-state :x)
    (. player-state :y)
    0 scale))

{
 :update update
 :draw draw
}
