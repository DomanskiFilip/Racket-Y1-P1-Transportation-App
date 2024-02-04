#lang racket/gui

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
                 
(send myframe show #t)
