; control.fnl - aka utils
; commonly used functions go here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; functional programming ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fn all [xs]
  (accumulate [result true _ v (ipairs xs) &until (not result)]
    v))

(fn any [xs]
  (accumulate [result false _ v (ipairs xs) &until result]
    v))

(fn map [fun xs]
  (icollect [_ v (ipairs xs)] (fun v)))


;;;;;;;;;;;;;;;;;;
;; player input ;;
;;;;;;;;;;;;;;;;;;

(fn key [& str]
  (any (map love.keyboard.isDown str)))


{
 :key key
}
