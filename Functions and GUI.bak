#lang racket/gui
(require "Database.rkt")

;GUI

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
    [callback (lambda (value1 value2)
    (define value1 (send start get-value))
    (define value2 (send destination get-value))
     (if (equal? value1 value2)
      (send output set-value "Inputs are equal.")
      (send output set-value "Inputs are not equal.")))]) 

;Directions output field
(define output(new text-field%
    [label "  Directions: "]
    [enabled #f]
    [parent myframe]))

(define strike-warning(new text-field%
                           [label "  Strikes on:  "]
                           [parent myframe]
                           [enabled #f]))

(send myframe show #t)

;Functions

; Returns the neighbors of a given station, could be used to get a route if done right
; This also returns all neighbors, even the ones going backwards or forwards
(define (get-neighbours line station)
  (define edges (hash-ref line 'edges '()))
  (define neighbors (filter (lambda (edge) (or (equal? station (car edge)) (equal? station (cadr edge)))) edges))
  (map (lambda (neighbour)
         (if (equal? station (car neighbour))
             (list (cadr neighbour) (caddr neighbour))
             (list (car neighbour) (caddr neighbour))))
       neighbors))

;returns just next station
(define (get-neighbours-next line station)
  (define edges (hash-ref line 'edges '()))
  (define neighbors (filter (lambda (edge) (or (equal? station (car edge)) )) edges))
  (map (lambda (neighbour)
         (if (equal? station (car neighbour))
             (list (cadr neighbour) (caddr neighbour))
             (list (car neighbour) (caddr neighbour))))
       neighbors))

;returns just previous station
(define (get-neighbours-previous line station)
  (define edges (hash-ref line 'edges '()))
  (define neighbors (filter (lambda (edge) (or (equal? station (cadr edge)) )) edges))
  (map (lambda (neighbour)
         (if (equal? station (car neighbour))
             (list (cadr neighbour) (caddr neighbour))
             (list (car neighbour) (caddr neighbour))))
       neighbors))

; Gets the weight (time) between the vertexes (stations), could be used to get the approximate time 
; to get from station a to station b
(define (get-time line station1 station2)
  (define edges (hash-ref line 'edges '()))
  (define time (ormap
                  (lambda (edge)
                    (if (equal? station1 (car edge)) 
                        (if (equal? station2 (cadr edge)) (caddr edge) #f)
                        (if (equal? station1 (cadr edge)) (caddr edge) #f)))
                  edges))
  time)

; If the program is to find connections between the lines, then the defines would have to change into 
; one unison name like "london-tube-network" or something like that, atm to make things clearer they 
; are separate to know which lines are done

;get-line function displays the entire line
(define (get-line line)
  (define edges (hash-ref line 'edges '()))
  (for ([i (reverse edges)])
    (let ([source (car i)]
          [destination (cadr i)]
          [time (caddr i)])
      (printf "~a -> ~a : ~a\n" source destination time))))

;A function that generates a number between 1 - 3 and adds it to the time field simulating a strike
(define (randomize-strike line)
  (define edges (hash-ref line 'edges '()))
  (for-each
   (lambda (edge)
     (let* ((random-strike (random 4)) ;Generates a random number between 1 - 3
            (default-time (caddr edge))
            (strike-time (+ default-time random-strike))) ;Adds the generated number to the default time
       (hash-set! line 'edges ;Replaces the old time with the new time after the strike
                  (replace-edge (hash-ref line 'edges '())
                                (car edge) (cadr edge) strike-time)))) edges) line)

(define (replace-edge edges station1 station2 new-time)
  (map (lambda (edge)
         (if (and (equal? (car edge) station1) (equal? (cadr edge) station2)) ; Check if the current edge matches the specified stations
             (list station1 station2 new-time) ;If yes create a new edge with updated time if not keep the edges the same
             edge)) edges))

;A function that chooses a random line to strike
(define lines '("Northern Line" "Bakerloo Line" "Central Line" "Circle Line" "District Line" "Hammersmith City Line" "Jubilee Line" "Metropolitan Line" "Piccadilly Line" "Victoria Line"))
(define chosen-line (list-ref lines (random (length lines))))
(send strike-warning set-value chosen-line)
(printf "Strikes on: ~a\n" chosen-line)

;If Northern Line is chosen then strike Northern Line, if Bakerloo Line is chosen then strike Bakerloo Line etc.
(define (randomize-line-strike)
      (cond
        [(equal? chosen-line "Northern Line") (randomize-strike northern-line)]
        [(equal? chosen-line "Bakerloo Line") (randomize-strike bakerloo-line)]
        [(equal? chosen-line "Central Line") (randomize-strike central-line)]
        [(equal? chosen-line "Circle Line") (randomize-strike circle-line)]
        [(equal? chosen-line "District Line") (randomize-strike district-line)]
        [(equal? chosen-line "Hammersmith City Line") (randomize-strike hammersmith-city-line)]
        [(equal? chosen-line "Jubilee Line") (randomize-strike jubilee-line)]
        [(equal? chosen-line "Metropolitan Line") (randomize-strike metropolitan-line)]
        [(equal? chosen-line "Piccadilly Line") (randomize-strike piccadilly-line)]
        [(equal? chosen-line "Victoria Line") (randomize-strike victoria-line)]))
       
(randomize-line-strike)

;(get-line northern-line) ;Displays an entire line
