#lang racket/gui
(require racket/gui/base)
(require "Database.rkt")

;GUI

(define lines '("Northern Line High Barnet via bank" "Northern Line Edgware via bank" "Bakerloo Line" "Central Line" "Circle Line" "District Line" "Hammersmith City Line" "Jubilee Line" "Metropolitan Line" "Piccadilly Line" "Victoria Line"))
(define chosen-line (list-ref lines (random (length lines))))
(define start-stations-list '())

;Get stations
(define (get-stations start-line-v)
  (cond
    [(equal? start-line-v "Northern Line High Barnet via bank") (add-to-stations-list northern-line-high-barnet-via-bank)]
    [(equal? start-line-v "Northern Line Edgware via bank") (add-to-stations-list northern-line-edgware-via-bank)]
    ;  [(equal? start-line-v "Northern Line Mill Hill East via bank") (add-to-stations-list northern-line-mill-hill-east-via-bank)]
    ;  [(equal? start-line-v "Northern Line High Barnet via warren street") (add-to-stations-list northern-line-high-barnet-via-warren-street)]
    ;  [(equal? start-line-v "Northern Line Edgware via warren street") (add-to-stations-list northern-line-mill-hill-east-via-warren-street)]
    ;  [(equal? start-line-v "Northern Line Mill Hill East via warren street") (add-to-stations-list northern-line-edgware-via-warren-street)]
    [(equal? start-line-v "Bakerloo Line") (add-to-stations-list bakerloo-line)]    
    [(equal? start-line-v "Central Line") (add-to-stations-list central-line)]    
    [(equal? start-line-v "District Line") (add-to-stations-list district-line)] 
    [(equal? start-line-v "Hammersmith City Line") (add-to-stations-list hammersmith-city-line)]    
    [(equal? start-line-v "Jubilee Line") (add-to-stations-list jubilee-line)]    
    [(equal? start-line-v "Metropolitan Line") (add-to-stations-list metropolitan-line)]
    [(equal? start-line-v "Piccadilly Line") (add-to-stations-list piccadilly-line)]
    [(equal? start-line-v "Victoria Line") (add-to-stations-list victoria-line)]
    [(equal? start-line-v "Circle Line") (add-to-stations-list circle-line)]  
    [else (printf "Invalid line")]))

(define (add-to-stations-list line)
  (for ([i (reverse (hash-ref line 'edges '()))])
    (set! start-stations-list (cons (car i) start-stations-list))))
 
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
                        [label "                        Line: "]
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
             [label "           Start station: "]
             [parent myframe]
             [choices start-stations-list]
             [callback (lambda (event value)
                         (update-destination-station))]
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
                    [label "           Start station: "]
                    [parent myframe]
                    [choices start-stations-list]
                    [callback (lambda (event value)
                                (printf "Selected line (destination): ~a\n" (send start-station get-value))
                                (update-destination-station))]
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
(define destination-time-msg #f)

(define (initialize-destination-msg)
  (set! destination-msg
        (new message%
             [label "Destination"]
             [parent myframe])))

(define (initialize-destination-line)
  (set! destination-line
        (new combo-field%
             [label "Destination Line:       "]
             [parent myframe]
             [choices lines]
             [callback (lambda (event value)
                         (printf "Selected line (destination): ~a\n" (send destination-line get-value)) ; Debugging: Print selected line
                         (set! start-stations-list '())
                         (get-stations (send destination-line get-value))
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
             [label "Destination Station: "]
             [parent myframe]
             [choices start-stations-list]
             [callback (lambda (a b)
                         (printf "Selected line (destination): ~a\n" (send destination-station get-value))
                         (create-route (send start-line get-value) (send start-station get-value) (send start-line get-value) (send destination-station get-value))
                         (update-destination-path))]
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

(define path-msg #f)
(define destination-path #f) ; Define start-station initially as #f
(define path-time-msg #f)

(define (initialize-path-time-msg)
  (set! path-time-msg
        (new message%
             [label (string-append "Final Station: " (send destination-station get-value) "\nRoute will take: " (number->string (total-time new-time-list)) " minutes")]
             [parent myframe])))

(define (initialize-path-msg)
  (set! path-msg
        (new message%
             [label (string-append "Starting Station: " (send start-station get-value))]
             [parent myframe])))

(define (initialize-destination-path)
  (set! destination-path
        (new radio-box%
             [label " "]
             [parent myframe]
             [choices new-path-list]
             [selection #f]
             [enabled #f])))

(define (update-destination-path)
  (if (not (equal? destination-path #f))
      (begin
        (send myframe delete-child path-msg)
        (send myframe delete-child destination-path)
        (send myframe delete-child path-time-msg)
        ; Create new destination components
        (initialize-path-msg)
        (initialize-destination-path)
        (initialize-path-time-msg))
      (begin
        ; If destination is #f, initialize new destination components
        (initialize-path-msg)
        (initialize-destination-path)
        (initialize-path-time-msg))))

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
            (default-time (cadr edge))
            (strike-time (+ default-time random-strike))) ;Adds the generated number to the default time
       (hash-set! line 'edges ;Replaces the old time with the new time after the strike
                  (replace-edge (hash-ref line 'edges '())
                                (car edge) (cadr edge) strike-time)))) edges) line)

(define (replace-edge edges station1 station2 new-time)
  (map (lambda (edge)
         (if (and (equal? (car edge) station1) (equal? (cadr edge) station2))
             (list station1 new-time)  ; Update only the time of the existing edge
             edge))
       edges))

;A function that chooses a random line to strike
(send strike-warning set-value chosen-line)
(printf "Strikes on: ~a\n" chosen-line)

;If Northern Line is chosen then strike Northern Line, if Bakerloo Line is chosen then strike Bakerloo Line etc.
(define (randomize-line-strike)
  (cond
    [(equal? chosen-line "Northern Line High Barnet via bank") (randomize-strike northern-line-high-barnet-via-bank)]
    [(equal? chosen-line "Northern Line Edgware via bank") (randomize-strike northern-line-edgware-via-bank)]
    ;  [(equal? chosen-line "Northern Line Mill Hill East via Bank") (randomize-strike northern-line-mill-hill-east-via-bank)]
    ;  [(equal? chosen-line "Northern Line High Barnet via Warren Street") (randomize-strike northern-line-high-barnet-via-warren-street)]
    ;  [(equal? chosen-line "Northern Line Edgware via Warren Street") (randomize-strike northern-line-edgware-via-warren-street)]
    ;  [(equal? chosen-line "Northern Line Mill Hill East via Warren Street") (randomize-strike northern-line-mill-hill-east-via-warren-street)]
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

; main function
(define (create-route line-start station-start line-end station-end)
  (cond [(equal? line-start line-end) 
         (let ((forward-route (create-route-same-lines line-start station-start station-end))
               (backward-route (create-route-same-lines line-start station-end station-start)))
           (if (null? forward-route)
               (if (null? backward-route)
                   (display "No path found.")
                   backward-route)
               forward-route))]
        [(create-route-different-lines line-start line-end)]))

(define (create-route-same-lines line station-start station-end)
  (cond
    [(equal? line "Northern Line High Barnet via bank") (all-stations-with-times northern-line-high-barnet-via-bank station-start station-end)]
    [(equal? line "Northern Line Edgware via bank") (all-stations-with-times northern-line-edgware-via-bank station-start station-end)]
    [(equal? line "Bakerloo Line") (all-stations-with-times bakerloo-line station-start station-end)]
    [(equal? line "Central Line") (all-stations-with-times central-line station-start station-end)]
    [(equal? line "Circle Line") (all-stations-with-times circle-line station-start station-end)]
    [(equal? line "District Line") (all-stations-with-times district-line station-start station-end)]
    [(equal? line "Hammersmith City Line") (all-stations-with-times hammersmith-city-line station-start station-end)]
    [(equal? line "Jubilee Line") (all-stations-with-times jubilee-line station-start station-end)]
    [(equal? line "Metropolitan Line") (all-stations-with-times metropolitan-line station-start station-end)]
    [(equal? line "Piccadilly Line") (all-stations-with-times piccadilly-line station-start station-end)]
    [(equal? line "Victoria Line") (all-stations-with-times victoria-line station-start station-end)]))


(define path-list '())
(define new-path-list '())
(define time-list '())
(define new-time-list '())

(define (all-stations-with-times line station1 station2)
  (define path-list '())
  (define time-list '())
  
  ; Populate path-list and time-list
  (for ([i (hash-ref line 'edges '())])
    (set! path-list (cons (car i) path-list))
    (set! time-list (cons (cadr i) time-list)))

  ; Determine direction
  (define direction (if (member station1 path-list)
                        'forward
                        'backward))
  
  ; Reverse lists if traveling backward
  (when (eq? direction 'backward)
    (set! path-list (reverse path-list))
    (set! time-list (reverse time-list)))

  ; Find path and corresponding times
  (let ((stations-and-times (find-path-and-times path-list time-list station1 station2 direction)))
    (set! new-path-list (car stations-and-times))
    (set! new-time-list (cdr stations-and-times)))

  ; Reverse lists back if traveling backward
  (when (eq? direction 'backward)
    (set! new-path-list (reverse new-path-list))
    (set! new-time-list (reverse new-time-list)))
    
  ; Display the result
  (if (null? new-path-list)
      (display "No path found.")
      (begin
        (display "Stations between ")
        (display station1)
        (display " and ")
        (display station2)
        (display ":\n")
        (display-stations-with-times new-path-list new-time-list)
        (newline)
        (display "Total Time: ")
        (display (total-time new-time-list))
        (newline))))

(define (total-time time-list)
  (if (null? time-list)
      0
      (+ (car time-list) (total-time (cdr time-list)))))

(define (find-path-and-times path-list time-list station1 station2 direction)
  (let loop ((lst path-list) (times time-list) (found1? #f) (found2? #f) (result '()) (time-result '()))
    (cond
      ((null? lst) (if (and found1? found2?) (cons (reverse result) (reverse time-result)) '())) ; If the end of the list is reached, return the result
      ((equal? (car lst) station1)
       (loop (cdr lst) (cdr times) #t found2? result (cons (car times) time-result))) ; If station1 is found, set found1? to true and accumulate time
      ((equal? (car lst) station2)
       (loop (cdr lst) (cdr times) found1? #t (cons (car lst) result) (cons (car times) time-result))) ; If station2 is found, set found2? to true and return the result with time
      (found1? (loop (cdr lst) (cdr times) #t found2? (cons (car lst) result) (cons (car times) time-result))) ; If station1 is found and found1? is true, accumulate elements
      (else (loop (cdr lst) (cdr times) found1? found2? result time-result))))) ; Otherwise, continue iterating

(define (display-stations-with-times stations times)
  (if (null? stations)
      '()
      (begin
        (display (car stations))
        (display " (")
        (display (car times))
        (display " minutes) -> ")
        (display-stations-with-times (cdr stations) (cdr times)))))

(define (create-route-different-lines line-start line-end)
  (printf "create-route-different-lines")
  (display line-start)
  (display line-end))
