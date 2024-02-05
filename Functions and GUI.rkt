#lang racket/gui
(require racket/gui/base)
(require "Database.rkt")


;GUI

(define lines '("Northern Line" "Bakerloo Line" "Central Line" "Circle Line" "District Line" "Hammersmith City Line" "Jubilee Line" "Metropolitan Line" "Piccadilly Line" "Victoria Line"))
(define chosen-line (list-ref lines (random (length lines))))
(define start-stations-list '())

;Get stations

(define (get-stations start-line-v)
  (cond
    [(equal? start-line-v "Northern Line")
     (define edges (hash-ref northern-line 'edges '()))
     (for ([i (reverse edges)])
       (let ([station1 (car i)]
             [station2 (cadr i)]
             [time (caddr i)])
         (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Bakerloo Line")
 (define edges (hash-ref bakerloo-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Central Line")
 (define edges (hash-ref central-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "District Line")
 (define edges (hash-ref district-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Hammersmith City Line")
 (define edges (hash-ref hammersmith-city-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Jubilee Line")
 (define edges (hash-ref jubilee-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Metropolitan Line")
 (define edges (hash-ref metropolitan-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Piccadilly Line")
 (define edges (hash-ref piccadilly-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Victoria Line")
 (define edges (hash-ref victoria-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[(equal? start-line-v "Circle Line")
 (define edges (hash-ref circle-line 'edges '()))
 (for ([i (reverse edges)])
   (let ([station1 (car i)]
         [station2 (cadr i)]
         [time (caddr i)])
     (set! start-stations-list (cons station1 start-stations-list))))]

[else (printf " ")])
 )
 

;Window
(define myframe (new frame%
    [label "World's best travel app"]
    [width 500]
    [height 100]))

(new message%
     [label "Delays due to:"]
     [parent myframe])


(define strike-warning(new text-field%
                           [label "  Strikes on:  "]
                           [parent myframe]
                           [enabled #f]))

(new message%
     [label "Start"]
     [parent myframe])

;Start line input field
(define start-line (new combo-field%
    [label "            start-line: "]
    [parent myframe]
    [choices lines]
    [callback (lambda (event value)
                (printf "Selected line (start): ~a\n" (send start-line get-value)) ; Debugging: Print selected line
                (set! start-stations-list '())
                (get-stations (send start-line get-value))
                (update-start-station))]
    [enabled #t]))


; Delay the initialization of start-station until stations-list is populated
(define start-station #f) ; Define start-station initially as #f

; Function to initialize start-station once stations-list is populated
(define (initialize-start-station)
  (set! start-station
        (new combo-field%
                    [label "       start-station: "]
                    [parent myframe]
                    [choices start-stations-list]
                    [callback (lambda (event value)
                                (create-destination-line))]
                    [enabled #t])))

; Function to update start-station choices when stations-list is updated
(define (update-start-station)
  (if (not (equal? start-station #f))
      (begin
        ; Remove the previous start-station from the parent frame
        (send myframe delete-child start-station)
        ; Create a new combo-field for the updated stations list
        (let ([new-start-station
               (new combo-field%
                    [label "       start-station: "]
                    [parent myframe]
                    [choices start-stations-list]
                    [callback (lambda (event value)
                                (create-destination-line))]
                    [enabled #t])])
          (set! start-station new-start-station)))
      (initialize-start-station)))

; Define a callback function to be called after stations-list is populated
(define (stations-list-populated)
  (update-start-station))

; Get stations asynchronously and call stations-list-populated when done
(thread
 (lambda ()
   (get-stations (send start-line get-value))
   (stations-list-populated)))

; DESTINATION
(define destination-msg #f)
(define destination-line #f)

(define (initialize-destination-msg)
  (set! destination-msg
        (new message%
             [label "Destination"]
             [parent myframe])))

(define (initialize-destination-line)
  (set! destination-line
        (new combo-field%
             [label "       destination-line: "]
             [parent myframe]
             [choices lines]
             [callback (lambda (event value)
                (printf "Selected line (destination): ~a\n" (send destination-line get-value)) ; Debugging: Print selected line
                (set! start-stations-list '())
                (get-stations (send start-line get-value))
                        (update-destination-station))]
             [enabled #t])))

(define (create-destination-line)
   (if (not (equal? destination-line #f))
      (begin
        ; Remove the previous destination components from the parent frame
        (send myframe delete-child destination-msg)
        (send myframe delete-child destination-line)
        ; Create new destination components
        (initialize-destination-msg)
        (initialize-destination-line))
      (begin
        ; If destination is #f, initialize new destination components
        (initialize-destination-msg)
        (initialize-destination-line))))


(define destination-station #f) ; Define start-station initially as #f

; Function to initialize start-station once stations-list is populated
(define (initialize-destination-station)
  (set! destination-station
        (new combo-field%
                    [label "      destination-station: "]
                    [parent myframe]
                    [choices start-stations-list]
                    [enabled #t])))

; Function to update start-station choices when stations-list is updated
(define (update-destination-station)
  (if (not (equal? destination-station #f))
      (begin
        ; Remove the previous start-station from the parent frame
        (send myframe delete-child destination-station)
         ; Create new destination components
        (initialize-destination-station))
      (begin
        ; If destination is #f, initialize new destination components
        (initialize-destination-station))))


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





