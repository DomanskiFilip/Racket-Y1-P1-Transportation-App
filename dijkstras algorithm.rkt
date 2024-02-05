#lang racket


; Allows for the creation of a hash table to store the stations, their neighbors 
; and the time to travel to the next station
(define (make-mutable-graph)
  (make-hash '()))

; Adds the edge (connection between stations) to the vertexes (stations)
(define (add-edge! graph vertex1 vertex2 weight)
  (define new-edges (cons (list vertex1 vertex2 weight) (hash-ref graph 'edges '())))
  (hash-set! graph 'edges new-edges))

; Returns the neighbors of a given station, could be used to get a route if done right
; This also returns all neighbors, even the ones going backwards or forwards
(define (get-neighbors graph vertex)
  (define edges (hash-ref graph 'edges '()))
  (define neighbors (filter (λ (edge) (or (equal? vertex (car edge)) (equal? vertex (cadr edge)))) edges))
  (map (λ (neighbor) 
         (if (equal? vertex (car neighbor))
             (list (cadr neighbor) (caddr neighbor))
             (list (car neighbor) (caddr neighbor))))
       neighbors))

; Gets the weight (time) between the vertexes (stations), could be used to get the approximate time 
; to get from station a to station b
(define (get-weight graph vertex1 vertex2)
  (define edges (hash-ref graph 'edges '()))
  (define weight (ormap
                  (λ (edge)
                    (if (equal? vertex1 (car edge)) 
                        (if (equal? vertex2 (cadr edge)) (caddr edge) #f)
                        (if (equal? vertex1 (cadr edge)) (caddr edge) #f)))
                  edges))
  weight)


(define (dijkstra graph start end)
  (define vertices (make-hash))
  (define distances (make-hash))
  (define visited (make-hash))

  ;; Extract vertices and initialize distances
  (for/list (((key value) (in-hash graph)))
    (hash-set! vertices key #f)
    (hash-set! distances key +inf.0)) ; Set all distances to +inf.0 initially

  (hash-set! distances start 0) ; Set the distance to start vertex as 0

  (define (get-min-distance-vertex)
    (define min-vertex #f)
    (define min-distance +inf.0)

    (hash-for-each
     distances
     (λ (vertex distance)
       (unless (hash-ref visited vertex #f)
         (when (< distance min-distance)
           (set! min-vertex vertex)
           (set! min-distance distance)))))

    min-vertex)

  (define (relax-edges current)
    (define current-distance (hash-ref distances current +inf.0))
    (displayln (format "Processing edges for vertex: ~a" current))
    (hash-for-each
     graph
     (λ (from edges)
       (define from-vertex from)
       (for ((edge (in-list edges)))
         (let* ((to-vertex (car edge))
                (weight (caddr edge)) ; Use caddr to get the third element (weight)
                (new-distance (+ current-distance weight)))

           (displayln (format "  From ~a to ~a, weight: ~a, new distance: ~a"
                               from-vertex to-vertex weight new-distance))

           (when (equal? from-vertex current)
             (when (< new-distance (hash-ref distances to-vertex +inf.0))
               (hash-set! distances to-vertex new-distance)))))
       edges))

    (hash-set! visited current #t))

  (let loop ((current start))
    (when (not (equal? current end))
      (relax-edges current)
      (displayln (format "Visited vertex: ~a" current))
      (displayln (format "Current distances: ~a" (hash->list distances)))
      (let ((next (get-min-distance-vertex)))
        (unless (equal? next #f)
          (loop next)))))

  (displayln (format "Final distances: ~a" (hash->list distances)))
  (hash-ref distances end +inf.0))


;; Example usage
(define jubilee-line (make-mutable-graph))
(add-edge! jubilee-line "stratford" "west ham" 3)
(add-edge! jubilee-line "west ham" "canning town" 3)
(add-edge! jubilee-line "canning town" "north greenwich" 3)
(add-edge! jubilee-line "north greenwich" "canary wharf" 2)
(add-edge! jubilee-line "canary wharf" "canada water" 3)
(add-edge! jubilee-line "canada water" "bermondsey" 2)
(add-edge! jubilee-line "bermondsey" "london bridge" 3)
(add-edge! jubilee-line "london bridge" "southwark" 2)
(add-edge! jubilee-line "southwark" "waterloo" 1)
(add-edge! jubilee-line "waterloo" "westminster" 2)
(add-edge! jubilee-line "westminster" "green park" 3)
(add-edge! jubilee-line "green park" "bond street" 2)
(add-edge! jubilee-line "bond street" "baker street" 3)
(add-edge! jubilee-line "baker street" "st johns wood" 3)
(add-edge! jubilee-line "st johns wood" "swiss cottage" 2)
(add-edge! jubilee-line "swiss cottage" "finchley road" 2)
(add-edge! jubilee-line "finchley road" "west hampstead" 1)
(add-edge! jubilee-line "west hampstead" "kilburn" 2)
(add-edge! jubilee-line "kilburn" "willesden green" 2)
(add-edge! jubilee-line "willesden green" "dollis hill" 2)
(add-edge! jubilee-line "dollis hill" "neasden" 2)
(add-edge! jubilee-line "neasden" "wembley park" 3)
(add-edge! jubilee-line "wembley park" "kingsbury" 4)
(add-edge! jubilee-line "kingsbury" "queensbury" 2)
(add-edge! jubilee-line "queensbury" "canons park" 3)
(add-edge! jubilee-line "canons park" "stanmore" 2)

(displayln (dijkstra jubilee-line "bond street" "baker street"))
