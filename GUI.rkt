#lang racket/gui
(require "Functions.rkt")

;Window
(define myframe (new frame%
    [label "World's best travel app"]
    [width 250]
    [height 100]))

;Start location input field
(define start (new text-field%
    [label "            Start: "]
    [parent myframe]
    [style '(single)]
    [enabled #t]))

;Destination location input firld
(define destination (new text-field%
    [label "Destination: "]
    [parent myframe]
    [style '(single)]
    [enabled #t]))

;Start journey button
(new button%
    [label "Start Journey"]
    [parent myframe]
    [callback (lambda (a b)
    (send output set-value "idk :("))]) 

;Directions output field
(define output(new text-field%
    [label "  Directions: "]
    [enabled #f]
    [parent myframe]))

;show where are strikes
(define (randomize-line-strike)
  (let ((lines '(northern-line bakerloo central-line circle-line district-line hammersmith-city-line jubilee-line metropolitan-line piccadilly-line victoria-line)))
    (let ((chosen-line (list-ref lines (random (length lines)))))
      (let  ((msg (format "Strikes on: ~a" chosen-line)))
      (new message% [parent myframe] [label msg])))))

(define chosen-line (randomize-line-strike))
(define msg (format "Strikes on: ~a" chosen-line))

(send myframe show #t)

