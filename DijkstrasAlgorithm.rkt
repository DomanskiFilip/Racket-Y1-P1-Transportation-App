#lang racket
(require math)

; dijksta's algorithm:
; find the shortest path in a weighted graph
(define (dijkstra graph start end)

  ; distances is a hash table used to keep track of the shortest distance from
  ; the start node to each node in the graph.
  (define distances (make-hash))
  (hash-set! distances start 0)

  ; the priority-queue is a list to keep track of nodes and their distances in a
  ; priority order.
  (define priority-queue (list (cons 0 start)))

  ; get-distance retrieves the distance of a node from the distances hash table.
  ; if the node is not present, it returns positive infinity.
  (define (get-distance node) 
    (hash-ref distances node (λ () +inf.0)))

  ; update-distance! updates the distance of a node in the distance hash table.
  (define (update-distance! node new-distance)
    (hash-set! distances node new-distance))

  ; enqueue! enqueues a node with its distance into the priority queue.
  (define (enqueue! node distance)
    (set! priority-queue (cons (cons distance node) priority-queue)))

  ; dequeue! dequeues a node with the minimum distance from the priority queue.
  (define (dequeue!)
    (let* ((min-entry (argmin car priority-queue))
           (node (cdr min-entry))
           (distance (car min-entry)))
      (set! priority-queue (remove-entry priority-queue min-entry))
      (values node distance)))

  ; remove-entry removes an entry from the priority queue list.
  (define (remove-entry lst entry)
    (cond
      [(null? lst) '()]
      [(equal? (car lst) entry) (cdr lst)]
      [else (cons (car lst) (remove-entry (cdr lst) entry))]))

  ; for a given node, it iterates over its neighbors and calculates the new
  ; distance from the start node through the current node.
  ; if the new distance is shorter than the current recorded distance for the
  ; neighbor, it updates the distance and enqueues the neighbor.
  (define (process-node! node current-distance)
    (for ([neighbor (in-hash-keys (hash-ref graph node (λ () #hash())))]
          [weight (in-hash-values (hash-ref graph node))])
      (let ((new-distance (+ current-distance weight)))
        (when (< new-distance (get-distance neighbor))
          (update-distance! neighbor new-distance)
          (enqueue! neighbor new-distance)))))

  ; result stores all the stations while final-distance stores the total distance
  ; between stations
  (define result '())
  (define final-distance #f)

  ; main loop:
  ; continuously dequeues nodes from the priority queue until it is empty.
  ; for each dequeued node, it checks if it is the destination "end".
  ; if yes, it returns the shortest distance found so far.
  (let loop ()
  (if (not (null? priority-queue))
      (let-values (((current-node current-distance) (dequeue!)))
        (if (string=? current-node end)
            (begin
              (set! final-distance current-distance)
              (set! result (reverse (cons current-node result)))
              (values result final-distance))
            (begin
              (set! result (cons current-node result))
              (process-node! current-node current-distance)
              (loop))))
      (values result final-distance))))

(provide dijkstra)