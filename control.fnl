; control.fnl
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


;;;;;;;;;;
;; meth ;;
;;;;;;;;;;

(fn get-normalizer [side-a side-b]
  (let [h (math.sqrt (+ (^ side-a 2) (^ side-b 2)))]
    (/ (/ 2 (+ side-a side-b)) h)))

(fn bool-to-int [b]
  (if b 1 0))



{
 :key key
 :map map
 :normalizer get-normalizer
 :bool-to-int bool-to-int
}
