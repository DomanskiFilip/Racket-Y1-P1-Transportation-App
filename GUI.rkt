#lang racket/gui
(define myframe (new frame%
    [label "World's best travel app"]
    [width 250]
    [height 100]))

(define start (new text-field%
    [label "            Start: "]
    [parent myframe]
    [style '(single)]
    [enabled #t]))

(define destination (new text-field%
    [label "Destination: "]
    [parent myframe]
    [style '(single)]
    [enabled #t]))

(new button%
    [label "Start Journey"]
    [parent myframe]
    [callback (lambda (a b)
    (send output set-value "idk :("))])


(define output(new text-field%
    [label "  Directions: "]
    [parent myframe]))
                 
(send myframe show #t)