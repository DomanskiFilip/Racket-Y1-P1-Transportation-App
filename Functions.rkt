#lang racket

; Allows for the creation of a hash table to store the stations, their neighbors 
; and the time to travel to the next station
(define (make-mutable-graph)
  (make-hash '()))

; Adds the edge (connection between stations) to the vertexes (stations)
(define (add-edge! line station1 station2 time)
  (define new-edges (cons (list station1 station2 time) (hash-ref line 'edges '())))
  (hash-set! line 'edges new-edges))

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

; Northern Line
(define northern-line (make-mutable-graph))
(add-edge! northern-line "high barnet" "totteridge & whetstone" 4)
(add-edge! northern-line "totteridge & whetstone" "woodside park" 2)
(add-edge! northern-line "woodside park" "west finchley" 2)
(add-edge! northern-line "west finchley" "finchley central" 2)
(add-edge! northern-line "finchley central" "mill hill east" 3)
(add-edge! northern-line "finchley central" "east finchley" 4)
(add-edge! northern-line "east finchley" "highgate" 2)
(add-edge! northern-line "highgate" "archway" 3)
(add-edge! northern-line "archway" "tufnell park" 2)
(add-edge! northern-line "tufnell park" "kentish town" 2)
(add-edge! northern-line "kentish town" "camden town" 2)
(add-edge! northern-line "camden town" "chalk farm" 2)
(add-edge! northern-line "chalk farm" "belsize park" 2)
(add-edge! northern-line "belsize park" "hampstead" 2)
(add-edge! northern-line "hampstead" "golders green" 4)
(add-edge! northern-line "golders green" "brent cross" 3)
(add-edge! northern-line "brent cross" "hendon central" 2)
(add-edge! northern-line "hendon central" "colindale" 3)
(add-edge! northern-line "colindale" "burnt oak" 2)
(add-edge! northern-line "burnt oak" "edgeware" 3)
(add-edge! northern-line "camden town" "euston" 3)
(add-edge! northern-line "camden town" "mornington crescent" 2)
(add-edge! northern-line "mornington crescent" "euston" 1)
(add-edge! northern-line "euston" "kings cross st pancras" 2)
(add-edge! northern-line "kings cross st pancras" "angel" 2)
(add-edge! northern-line "angel" "old street" 3)
(add-edge! northern-line "old street" "moorgate" 2)
(add-edge! northern-line "moorgate" "bank" 2)
(add-edge! northern-line "bank" "london bridge" 2)
(add-edge! northern-line "london bridge" "borough" 1)
(add-edge! northern-line "borough" "elephant & castle" 2)
(add-edge! northern-line "elephant & castle" "kennington" 2)
(add-edge! northern-line "euston" "warren street" 1)
(add-edge! northern-line "warren street" "goodge street" 2)
(add-edge! northern-line "goodge street" "tottenham court road" 1)
(add-edge! northern-line "tottenham court road" "leicester square" 1)
(add-edge! northern-line "leicester square" "charing cross" 2)
(add-edge! northern-line "charing cross" "embankment" 1)
(add-edge! northern-line "embankment" "waterloo" 2)
(add-edge! northern-line "waterloo" "kennington" 3)
(add-edge! northern-line "kennington" "nine elms" 2)                ; No given off-peak times
(add-edge! northern-line "nine elms" "battersea power station" 2)   ; No given off-peak times
(add-edge! northern-line "kennington" "oval" 2)
(add-edge! northern-line "oval" "stockwell" 2)
(add-edge! northern-line "stockwell" "clapham north" 2)
(add-edge! northern-line "clapham north" "clapham common" 1)
(add-edge! northern-line "clapham common" "clapham south" 2)
(add-edge! northern-line "clapham south" "balham" 2)
(add-edge! northern-line "balham" "tooting bec" 2)
(add-edge! northern-line "tooting bec" "tooting broadway" 2)
(add-edge! northern-line "tooting broadway" "colliers wood" 2)
(add-edge! northern-line "colliers wood" "south wimbledon" 2)
(add-edge! northern-line "south wimbledon" "morden" 3)

;Bakerloo line
(define bakerloo-line (make-mutable-graph))
(add-edge! bakerloo-line "harrow & wealdstone" "kenton" 3)
(add-edge! bakerloo-line "kenton" "south kenton" 2)
(add-edge! bakerloo-line "south kenton" "north wembley" 1)
(add-edge! bakerloo-line "north wembley" "wembley central" 2)
(add-edge! bakerloo-line "wembley central" "stonebridge park" 3)
(add-edge! bakerloo-line "stonebridge park" "harlesden" 2)
(add-edge! bakerloo-line "harlesden" "willesden junction" 2)
(add-edge! bakerloo-line "willesden junction" "kensal green" 3)
(add-edge! bakerloo-line "kensal green" "queens park" 3)
(add-edge! bakerloo-line "queens park" "kilburn park" 2)
(add-edge! bakerloo-line "kilburn park" "maida vale" 1)
(add-edge! bakerloo-line "maida vale" "warwick avenue" 2)
(add-edge! bakerloo-line "warwick avenue" "paddington" 2)
(add-edge! bakerloo-line "paddington" "edgeware road" 2)
(add-edge! bakerloo-line "edgeware road" "marylebone" 1)
(add-edge! bakerloo-line "marylebone" "baker street" 1)
(add-edge! bakerloo-line "baker street" "regents park" 2)
(add-edge! bakerloo-line "regents park" "oxford circus" 2)
(add-edge! bakerloo-line "oxford circus" "piccadilly circus" 2)
(add-edge! bakerloo-line "piccadilly circus" "charing cross" 2)
(add-edge! bakerloo-line "charing cross" "embankment" 1)
(add-edge! bakerloo-line "embankment" "waterloo" 1)
(add-edge! bakerloo-line "waterloo" "lambeth north" 2)
(add-edge! bakerloo-line "lambeth north" "elephant & castle" 2)

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
             (list station1 station2 new-time) ;If yes createa new edge with updated time if not keep the edges the same
             edge)) edges))

;A function that chooses a random line to strike
;For now the function can only choose between Northern and Bakerloo line as Racket crashes when all the lines are in the file
(define (randomize-line-strike)
  (let ((lines '(northern-line bakerloo))) ;Insert all of the available lines into this list
    (let ((chosen-line (list-ref lines (random (length lines))))) ;Randomly chooses a line
      (cond 
        ((equal? chosen-line 'northern-line) (randomize-strike northern-line)) ;If the randomly chosen line is Northern line strike Northern line etc.
        ((equal? chosen-line 'bakerloo) (randomize-strike bakerloo-line))
        (else (error "Line doesn't exist"))))))

(randomize-line-strike) ;Show times on a randomly selected line after times have been updated due to a randomised strike