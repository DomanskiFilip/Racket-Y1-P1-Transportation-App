#lang racket
"struct for stations previousStation -> currentStation -> nextStation ->  previousStationTime -> nextStationTime"
(struct station (previousStation currentStation nextStation previousStationTime nextStationTime) #:mutable)
"populationg struct for sample line A"
(define station1_A (station "station2" "station1" "Station2" 3 3))
(define station2_A (station "station1" "station2" "Station3" 3 2))
(define station3_A (station "station2" "station3" "station2" 2 2))
(station-currentStation station1_A)
(station-currentStation station2_A)
(station-currentStation station3_A)
"populationg struct for sample line B"
(define station1_B (station "station2" "station1" "Station2" 4 4))
(define station2_B (station "station1" "station2" "Station3" 4 5))
(define station3_B (station "station2" "station3" "station2" 5 5))
(station-currentStation station1_B)
(station-currentStation station2_B)
(station-currentStation station3_B)
"very simple structure idea 1: as seen above we can create a list of structures seperate for every line with info about previous and next station names and times that way we can create an illusion of stations intersecting. After a function decies which line would be faster (scaning all lines times in certain direction) it would pick the fastest line and use its list of structures and from users perspective because the names of stations would match it would seem as if the lines intersect. If we would want to make it so it creates a path useing two lines we could write a function that checks if the current station names and the same for two lines beeing checked - initial structure idea Filip D."
