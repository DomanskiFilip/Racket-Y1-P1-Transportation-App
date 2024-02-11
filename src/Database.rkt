#lang racket

(define tfl-line
  ; Northern Line
  (hash
   "High Barnet"
   (hash "Totteridge & Whetstone" 4)
   
   "Totteridge & Whetstone"
   (hash "High Barnet" 4
         "Woodside Park" 2)
   
   "Woodside Park"
   (hash "Totteridge & Whetstone" 2
         "West Finchley" 2)
   
   "West Finchley"
   (hash "Woodside Park" 2
         "Finchley Central" 2)
   
   "Finchley Central"
   (hash "West Finchley" 2
         "Mill Hill East" 3
         "East Finchley" 4)
   
   "Mill Hill East"
   (hash "Finchley Central" 3)
   
   "East Finchley"
   (hash "Finchley Central" 4
         "Highgate" 2)

   "Highgate"
   (hash "East Finchley" 2
         "Archway" 3)

   "Archway"
   (hash "Highgate" 3
         "Tufnell Park" 2)

   "Tufnell Park"
   (hash "Archway" 2
         "Kentish Town" 2)

   "Kentish Town"
   (hash "Tufnell Park" 2
         "Camden Town" 2)

   "Camden Town"
   (hash "Kentish Town" 2
         "Euston (Northern)" 3
         "Mornington Crescent" 2
         "Chalk Farm" 2)

   "Euston (Northern)"
   (hash "Euston (Victoria)" 1
         "Camden Town" 3
         "King's Cross St. Pancras (Northern)" 2
         "Mornington Crescent" 1
         "Warren Street (Northern)" 1)

   "King's Cross St. Pancras (Northern)"
   (hash "King's Cross St. Pancras (Circle)" 1
         "King's Cross St. Pancras (Hammersmith & City)" 1
         "King's Cross St. Pancras (Metropolitan)" 1
         "King's Cross St. Pancras (Piccadilly)" 1
         "King's Cross St. Pancras (Victoria)" 1
         "Euston (Northern)" 2
         "Angel" 2)

   "Angel"
   (hash "King's Cross St. Pancras (Northern)" 2
         "Old Street" 3)

   "Old Street"
   (hash "Angel" 3
         "Moorgate (Northern)" 2)

   "Moorgate (Northern)"
   (hash "Moorgate (Circle)" 1
         "Moorgate (Hammersmith & City)" 1
         "Moorgate (Metropolitan)" 1
         "Old Street" 2
         "Bank (Northern)" 2)

   "Bank (Northern)"
   (hash "Bank (Central)" 1
         "Monument (Circle)" 1
         "Monument (District)" 1
         "Bank (Waterloo & City)" 1
         "Moorgate (Northern)" 2
         "London Bridge (Northern)" 2)

   "London Bridge (Northern)"
   (hash "London Bridge (Jubilee)" 1
         "Bank (Northern)" 2
         "Borough" 1)
   
   "Borough"
   (hash "London Bridge (Northern)" 1
         "Elephant & Castle (Northern)" 2)

   "Elephant & Castle (Northern)"
   (hash "Elephant & Castle (Bakerloo)" 1
         "Borough" 2
         "Kennington" 2)

   "Mornington Crescent"
   (hash "Camden Town" 2
         "Euston (Northern)" 1)

   "Warren Street (Northern)"
   (hash "Warren Street (Victoria)" 1
         "Euston (Northern)" 1
         "Goodge Street" 2)

   "Goodge Street"
   (hash "Warren Street (Northern)" 2
         "Tottenham Court Road (Northern)" 1)

   "Tottenham Court Road (Northern)"
   (hash "Tottenham Court Road (Central)"1
         "Goodge Street" 1
         "Leicester Square (Northern)" 1)

   "Leicester Square (Northern)"
   (hash "Leicester Square (Piccadilly)" 1
         "Tottenham Court Road (Northern)" 1
         "Charing Cross" 2)

   "Charing Cross"
   (hash "Leicester Square (Northern)" 2
         "Embankment (Northern)" 1)

   "Embankment (Northern)"
   (hash "Embankment (Bakerloo)" 1
         "Embankment (Circle)" 1
         "Embankment (District)" 1
         "Charing Cross" 1
         "Waterloo (Northern)" 2)

   "Waterloo (Northern)"
   (hash "Waterloo (Bakerloo)" 1
         "Waterloo (Jubilee)" 1
         "Waterloo (Waterloo & City)" 1
         "Embankment (Northern)" 2
         "Kennington" 3)

   "Kennington"
   (hash "Elephant & Castle (Northern)" 2
         "Waterloo (Northern)" 3
         "Oval" 2
         "Nine Elms" 2)

   "Chalk Farm"
   (hash "Camden Town" 2
         "Belsize Park" 2)

   "Belsize Park"
   (hash "Chalk Farm" 2
         "Hampstead" 2)

   "Hampstead"
   (hash "Belsize Park" 2
         "Golders Green" 4)

   "Golders Green"
   (hash "Hampstead" 4
         "Brent Cross" 3)

   "Brent Cross"
   (hash "Golders Green" 3
         "Hendon Central" 2)

   "Hendon Central"
   (hash "Brent Cross" 2
         "Colindale" 3)

   "Colindale"
   (hash "Hendon Central" 3
         "Burnt Oak" 2)

   "Burnt Oak"
   (hash "Colindale" 2
         "Edgware" 3)

   "Edgware"
   (hash "Burnt Oak" 3)

   "Oval"
   (hash "Kennington" 2
         "Stockwell (Northern)" 2)

   "Stockwell (Northern)"
   (hash "Oval" 2
         "Clapham North" 2)

   "Clapham North"
   (hash "Stockwell (Northern)" 2
         "Clapham Common" 1)

   "Clapham Common"
   (hash "Clapham North" 1
         "Clapham South" 2)

   "Clapham South"
   (hash "Clapham Common" 2
         "Balham" 2)

   "Balham"
   (hash "Clapham South" 2
         "Tooting Bec" 2)

   "Tooting Bec"
   (hash "Balham" 2
         "Tooting Broadway" 2)

   "Tooting Broadway"
   (hash "Tooting Bec" 2
         "Colliers Wood" 2)

   "Colliers Wood"
   (hash "Tooting Broadway" 2
         "South Wimbledon" 2)

   "South Wimbledon"
   (hash "Colliers Wood" 2
         "Morden" 3)

   "Morden"
   (hash "South Wimbledon" 3)

   "Nine Elms"
   (hash "Kennington" 2
         "Battersea Power Station" 2)

   "Battersea Power Station"
   (hash "Nine Elms" 2)


   ; Bakerloo
   "Harrow & Wealdstone"
   (hash "Kenton" 3)
   
   "Kenton"
   (hash "Harrow & Wealdstone" 3
         "South Kenton" 2)
   
   "South Kenton"
   (hash "Kenton" 2
         "North Wembley" 1)
   
   "North Wembley"
   (hash "South Kenton" 1
         "Wembley Central" 2)
   
   "Wembley Central"
   (hash "North Wembley" 2
         "Stonebridge Park" 3)
   
   "Stonebridge Park"
   (hash "Wembley Central" 3
         "Harlesden" 2)
   
   "Harlesden"
   (hash "Stonebridge Park" 2
         "Willesden Junction" 2)
   
   "Willesden Junction"
   (hash "Harlesden" 2
         "Kensal Green" 3)
   
   "Kensal Green"
   (hash "Willesden Junction" 3
         "Queens Park" 3)
   
   "Queens Park"
   (hash "Kensal Green" 3
         "Kilburn Park" 2)
   
   "Kilburn Park"
   (hash "Queens Park" 2
         "Maida Vale" 1)
   
   "Maida Vale"
   (hash "Kilburn Park" 1
         "Warwick Avenue" 2)
   
   "Warwick Avenue"
   (hash "Maida Vale" 2
         "Paddington (Bakerloo)" 2)
   
   "Paddington (Bakerloo)"
   (hash "Paddington (Circle)" 1
         "Paddington (District)" 1
         "Warwick Avenue" 2
         "Edgware Road" 2)
   
   "Edgware Road"
   (hash "Paddington (Bakerloo)" 2
         "Marylebone" 1)
   
   "Marylebone"
   (hash "Edgware Road" 1
         "Baker Street (Bakerloo)" 1)
   
   "Baker Street (Bakerloo)"
   (hash "Baker Street (Circle)" 1
         "Baker Street (Hammersmith & City)" 1
         "Baker Street (Jubilee)" 1
         "Baker Street (Metropolitan)" 1
         "Marylebone" 1
         "Regents Park" 2)
   
   "Regents Park"
   (hash "Baker Street (Bakerloo)" 2
         "Oxford Circus (Bakerloo)" 2)
   
   "Oxford Circus (Bakerloo)"
   (hash "Oxford Circus (Central)" 1
         "Oxford Circus (Victoria)" 1
         "Regents Park" 2
         "Piccadilly Circus (Bakerloo)" 2)
   
   "Piccadilly Circus (Bakerloo)"
   (hash "Piccadilly Circus (Piccadilly)" 1
         "Oxford Circus (Bakerloo)" 2
         "Charing Cross" 2)
   
   "Charing Cross"
   (hash "Piccadilly Circus (Bakerloo)" 2
         "Embankment (Bakerloo)" 1)
   
   "Embankment (Bakerloo)"
   (hash "Embankment (Circle)" 1
         "Embankment (District)" 1
         "Embankment (Northern)" 1
         "Charing Cross" 1
         "Waterloo (Bakerloo)" 1)
   
   "Waterloo (Bakerloo)"
   (hash "Waterloo (Northern)" 1
         "Waterloo (Waterloo & City)" 1
         "Waterloo (Jubilee)" 1
         "Embankment (Bakerloo)" 1
         "Lambeth North" 2)
   
   "Lambeth North"
   (hash "Waterloo (Bakerloo)" 2
         "Elephant & Castle (Bakerloo)" 2)

   "Elephant & Castle (Bakerloo)"
   (hash "Elephant & Castle (Northern)" 1
         "Lambeth North" 2)


   ; Central
   "West Ruislip"
   (hash "Ruislip Gardens" 4)
   
   "Ruislip Gardens"
   (hash "West Ruislip" 4
         "South Ruislip" 2)
   
   "South Ruislip"
   (hash "Ruislip Gardens" 2
         "Northolt" 3)
   
   "Northolt"
   (hash "South Ruislip" 3
         "Greenford" 2)
   
   "Greenford"
   (hash "Northolt" 2
         "Perivale" 3)
   
   "Perivale"
   (hash "Greenford" 3
         "Hanger Lane" 3)
   
   "Hanger Lane"
   (hash "Perivale" 3
         "North Acton" 3)
   
   "North Acton"
   (hash "Hanger Lane" 3
         "West Acton" 3
         "East Acton" 2)
   
   "West Acton"
   (hash "North Acton" 3
         "Ealing Broadway (Central)" 3)
   
   "Ealing Broadway (Central)"
   (hash "Ealing Broadway (District)" 1
         "West Acton" 3)
   
   "East Acton"
   (hash "North Acton" 2
         "White City" 3)
   
   "White City"
   (hash "East Acton" 3
         "Shepherd's Bush" 2)
   
   "Shepherd's Bush"
   (hash "White City" 2
         "Holland Park" 2)
   
   "Holland Park"
   (hash "Shepherd's Bush" 2
         "Notting Hill Gate (Central)" 1)
   
   "Notting Hill Gate (Central)"
   (hash "Notting Hill Gate (Circle)" 1
         "Notting Hill Gate (District)" 1
         "Holland Park" 1
         "Queensway" 2)
   
   "Queensway"
   (hash "Notting Hill Gate (Central)" 2
         "Lancaster Gate" 2)
   
   "Lancaster Gate"
   (hash "Queensway" 2
         "Marble Arch" 2)
   
   "Marble Arch"
   (hash "Lancaster Gate" 2
         "Bond Street (Central)" 1)
   
   "Bond Street (Central)"
   (hash "Bond Street (Jubilee)" 1
         "Marble Arch" 1
         "Oxford Circus (Central)" 2)
   
   "Oxford Circus (Central)"
   (hash "Oxford Circus (Bakerloo)" 1
         "Oxford Circus (Victoria)" 1
         "Bond Street (Central)" 2
         "Tottenham Court Road (Central)" 1)
   
   "Tottenham Court Road (Central)"
   (hash "Tottenham Court Road (Northern)" 1
         "Oxford Circus (Central)" 1
         "Holborn (Central)" 2)
   
   "Holborn (Central)"
   (hash "Holborn (Piccadilly)" 1
         "Tottenham Court Road (Central)" 2
         "Chancery Lane" 2)
   
   "Chancery Lane"
   (hash "Holborn (Central)" 2
         "St. Pauls" 2)
   
   "St. Pauls"
   (hash "Chancery Lane" 2
         "Bank (Central)" 2)
   
   "Bank (Central)"
   (hash "Monument (District)" 1
         "Bank (Northern)" 1
         "Bank (Waterloo & City)" 1
         "St. Pauls" 2
         "Liverpool Street (Central)" 2)
   
   "Liverpool Street (Central)"
   (hash "Liverpool Street (Circle)" 1
         "Liverpool Street (Hammersmith & City)" 1
         "Liverpool Street (Metropolitan)" 1
         "Bank (Central)" 2
         "Bethnal Green" 3)
   
   "Bethnal Green"
   (hash "Liverpool Street (Central)" 3
         "Mile End (Central)" 3)
   
   "Mile End (Central)"
   (hash "Mile End (District)" 1
         "Mile End (Hammersmith & City)" 1
         "Bethnal Green" 3
         "Stratford (Central)" 4)
   
   "Stratford (Central)"
   (hash "Stratford (Jubilee)" 1
         "Mile End (Central)" 4
         "Leyton" 3)
   
   "Leyton"
   (hash "Stratford (Central)" 3
         "Leytonstone" 2)
   
   "Leytonstone"
   (hash "Leyton" 2
         "Wanstead" 3
         "Snaresbrook" 3)
   
   "Wanstead"
   (hash "Leytonstone" 3
         "Redbridge" 2)
   
   "Redbridge"
   (hash "Wanstead" 2
         "Gants Hill" 3)
   
   "Gants Hill"
   (hash "Redbridge" 3
         "Newbury Park" 4)
   
   "Newbury Park"
   (hash "Gants Hill" 4
         "Barkingside" 2)
   
   "Barkingside"
   (hash "Newbury Park" 2
         "Fairlop" 2)
   
   "Fairlop"
   (hash "Barkingside" 2
         "Hainault" 2)
   
   "Hainault"
   (hash "Fairlop" 2
         "Grange Hill" 2)
   
   "Grange Hill"
   (hash "Hainault" 2
         "Chigwell" 2)
   
   "Chigwell"
   (hash "Grange Hill" 2
         "Roding Valley" 4)
   
   "Roding Valley"
   (hash "Chigwell" 4
         "Woodford" 3)
   
   "Woodford"
   (hash "Roding Valley" 3
         "South Woodford" 2
         "Buckhurst Hill" 4)
   
   "Snaresbrook"
   (hash "Leytonstone" 3
         "South Woodford" 2)
   
   "South Woodford"
   (hash "Snaresbrook" 2
         "Woodford" 2)
   
   "Woodford"
   (hash "South Woodford" 2
         "Buckhurst Hill" 4)
   
   "Buckhurst Hill"
   (hash "Woodford" 4
         "Loughton" 2)
   
   "Loughton"
   (hash "Buckhurst Hill" 2
         "Debden" 4)
   
   "Debden"
   (hash "Loughton" 4
         "Theydon Bois" 4)
   
   "Theydon Bois"
   (hash "Debden" 4
         "Epping" 3)
   
   "Epping"
   (hash "Theydon Bois" 3)
   

   ; Circle
   "Paddington (Circle)"
   (hash "Paddington (Bakerloo)" 1
         "Edgware Road (Circle)" 2
         "Bayswater" 2)
   
   "Edgware Road (Circle)"
   (hash "Edgware Road (Hammersmith & City)" 1
         "Edgware Road (District)" 1
         "Paddington (Circle)" 2
         "Baker Street (Circle)" 2)
   
   "Baker Street (Circle)"
   (hash "Baker Street (Hammersmith & City)" 1
         "Baker Street (Bakerloo)" 1
         "Baker Street (Jubilee)" 1
         "Baker Street (Metropolitan)" 1
         "Edgware Road (Circle)" 2
         "Great Portland Street (Circle)" 2)
   
   "Great Portland Street (Circle)"
   (hash "Great Portland Street (Hammersmith & City)" 1
         "Baker Street (Circle)" 2
         "Euston Square (Circle)" 2)
   
   "Euston Square (Circle)"
   (hash "Euston Square (Hammersmith & City)" 1
         "Great Portland Street (Circle)" 2
         "King's Cross St. Pancras (Circle)" 2)
   
   "King's Cross St. Pancras (Circle)"
   (hash "King's Cross St. Pancras (Hammersmith & City)" 1
         "King's Cross St. Pancras (Northern)" 1
         "King's Cross St. Pancras (Piccadilly)" 1
         "King's Cross St. Pancras (Victoria)" 1
         "Euston Square (Circle)" 2
         "Farringdon (Circle)" 3)
   
   "Farringdon (Circle)"
   (hash "Farringdon (Hammersmith & City)" 1
         "King's Cross St. Pancras (Circle)" 3
         "Barbican (Circle)" 2)
   
   "Barbican (Circle)"
   (hash "Farringdon (Circle)" 2
         "Moorgate (Circle)" 1)
   
   "Moorgate (Circle)"
   (hash "Moorgate (Northern)" 1
         "Barbican (Circle)" 1
         "Liverpool Street (Circle)" 2)
   
   "Liverpool Street (Circle)"
   (hash "Liverpool Street (Central)" 1
         "Moorgate (Circle)" 2
         "Aldgate" 2)
   
   "Aldgate"
   (hash "Liverpool Street (Circle)" 2
         "Tower Hill (Circle)" 2)
   
   "Tower Hill (Circle)"
   (hash "Tower Hill (District)" 1
         "Aldgate" 2
         "Monument (Circle)" 2)
   
   "Monument (Circle)"
   (hash "Bank (Central)" 1
         "Bank (Northern)" 1
         "Tower Hill (Circle)" 2
         "Cannon Street" 1)
   
   "Cannon Street"
   (hash "Monument (Circle)" 1
         "Mansion House" 1)
   
   "Mansion House"
   (hash "Cannon Street" 1
         "Blackfriars" 1)
   
   "Blackfriars"
   (hash "Mansion House" 1
         "Temple" 2)
   
   "Temple"
   (hash "Blackfriars" 2
         "Embankment (Circle)" 1)
   
   "Embankment (Circle)"
   (hash "Embankment (Bakerloo)" 1
         "Embankment (Northern)" 1
         "Temple" 1
         "Westminster (Circle)" 2)
   
   "Westminster (Circle)"
   (hash "Westminster (Jubilee)" 1
         "Embankment (Circle)" 2
         "St. James's Park" 1)
   
   "St. James's Park"
   (hash "Westminster (Circle)" 1
         "Victoria (Circle)" 2)
   
   "Victoria (Circle)"
   (hash "Victoria (Victoria)" 1
         "St. James's Park" 2
         "Sloane Square" 2)
   
   "Sloane Square"
   (hash "Victoria (Circle)" 2
         "South Kensington (Circle)" 2)
   
   "South Kensington (Circle)"
   (hash "South Kensington (District)" 1
         "South Kensington (Piccadilly)" 1
         "Sloane Square" 2
         "Gloucester Road (Circle)" 2)
   
   "Gloucester Road (Circle)"
   (hash "Gloucester Road (District)" 1
         "Gloucester Road (Piccadilly)" 1
         "South Kensington (Circle)" 2
         "High Street Kensington (Circle)" 3)
   
   "High Street Kensington (Circle)"
   (hash "High Street Kensington (District)" 1
         "Gloucester Road (Circle)" 3
         "Notting Hill Gate (Circle)" 2)
   
   "Notting Hill Gate (Circle)"
   (hash "Notting Hill Gate (Central)" 1
         "High Street Kensington (Circle)" 2
         "Bayswater" 2)
   
   "Bayswater"
   (hash "Notting Hill Gate (Circle)" 2
         "Paddington (Circle)" 2)


   ; District
   "Ealing Broadway (District)"
   (hash "Ealing Broadway (Central)" 1
         "Ealing Common (District)" 3)
   
   "Ealing Common (District)"
   (hash "Ealing Common (Piccadilly)" 1
         "Ealing Broadway (District)" 3
         "Acton Town (District)" 2)
   
   "Acton Town (District)"
   (hash "Acton Town (Piccadilly)" 1
         "Ealing Common (District)" 2
         "Chiswick Park" 2)
   
   "Chiswick Park"
   (hash "Acton Town (District)" 2
         "Turnham Green" 2)
   
   "Turnham Green"
   (hash "Chiswick Park" 2
         "Gunnersbury" 2
         "Stamford Brook" 2)
   
   "Gunnersbury"
   (hash "Turnham Green" 2
         "Kew Gardens" 3)
   
   "Kew Gardens"
   (hash "Gunnersbury" 3
         "Richmond" 3)
  
   "Richmond"
   (hash "Kew Gardens" 3)
   
   "Stamford Brook"
   (hash "Turnham Green" 2
         "Ravenscourt Park" 1)
   
   "Ravenscourt Park"
   (hash "Stamford Brook" 1
         "Hammersmith (District)" 2)
   
   "Hammersmith (District)"
   (hash "Hammersmith (Hammersmith & City)" 1
         "Hammersmith (Piccadilly)" 1
         "Ravenscourt Park" 2
         "Barons Court (District)" 1)
   
   "Barons Court (District)"
   (hash "Barons Court (Piccadilly)" 1
         "Hammersmith (District)" 1
         "West Kensington" 2)
   
   "West Kensington"
   (hash "Barons Court (District)" 2
         "Earl's Court (District)" 2)
   
   "Earl's Court (District)"
   (hash "West Kensington" 2
         "West Brompton" 2
         "Kensington (Olympia)" 3
         "High Street Kensington (District)" 3
         "Gloucester Road (District)" 2)
   
   "West Brompton"
   (hash "Earl's Court (District)" 2
         "Fulham Broadway" 1)
   
   "Fulham Broadway"
   (hash "West Brompton" 1
         "Parsons Green" 2)
   
   "Parsons Green"
   (hash "Fulham Broadway" 2
         "Putney Bridge" 3)
   
   "Putney Bridge"
   (hash "Parsons Green" 3
         "East Putney" 2)
   
   "East Putney"
   (hash "Putney Bridge" 2
         "Southfields" 2)
   
   "Southfields"
   (hash "East Putney" 2
         "Wimbledon Park" 2)
   
   "Wimbledon Park"
   (hash "Southfields" 2
         "Wimbledon" 3)

   "Wimbledon"
   (hash "Wimbledon Park" 3)
   
   "Kensington (Olympia)"
   (hash "Earl's Court (District)" 3)
   
   "High Street Kensington (District)"
   (hash "High Street Kensington (Circle)" 1
         "Earl's Court (District)" 3
         "Notting Hill Gate (District)" 2)
   
   "Notting Hill Gate (District)"
   (hash "Notting Hill Gate (Central)" 1
         "High Street Kensington (District)" 2
         "Bayswater" 2)
   
   "Bayswater"
   (hash "Notting Hill Gate (District)" 2
         "Paddington (District)" 2)
   
   "Paddington (District)"
   (hash "Bayswater" 2
         "Edgware Road (District)" 2)

   "Edgware Road (District)"
   (hash "Paddington (District)" 2)
   
   "Gloucester Road (District)"
   (hash "Gloucester Road (Circle)" 1
         "Earl's Court (District)" 2
         "South Kensington (District)" 2)
   
   "South Kensington (District)"
   (hash "South Kensington (Circle)" 1
         "South Kensington (Piccadilly)" 1
         "Gloucester Road (District)" 2
         "Sloane Square" 2)
   
   "Sloane Square"
   (hash "South Kensington (District)" 2
         "Victoria (District)" 2)
   
   "Victoria (District)"
   (hash "Victoria (Victoria)" 1
         "Sloane Square" 2
         "St. James's Park" 2)
   
   "St. James's Park"
   (hash "Victoria (District)" 2
         "Westminster (District)" 1)
   
   "Westminster (District)"
   (hash "Westminster (Jubilee)" 1
         "St. James's Park" 1
         "Embankment (District)" 2)
   
   "Embankment (District)"
   (hash "Embankment (Bakerloo)" 1
         "Embankment (Northern)" 1
         "Westminster (District)" 2
         "Temple" 1)
   
   "Temple"
   (hash "Embankment (District)" 1
         "Blackfriars" 2)
   
   "Blackfriars"
   (hash "Temple" 2
         "Mansion House" 1)
   
   "Mansion House"
   (hash "Blackfriars" 1
         "Cannon Street" 1)
   
   "Cannon Street"
   (hash "Mansion House" 1
         "Monument (District)" 1)
   
   "Monument (District)"
   (hash "Bank (Central)" 1
         "Monument (Circle)" 1
         "Bank (Northern)" 1
         "Cannon Street" 1
         "Tower Hill (District)" 2)
   
   "Tower Hill (District)"
   (hash "Tower Hill (Circle)" 1
         "Monument (District)" 2
         "Aldgate East (District)" 2)

   "Aldgate East (District)"
   (hash "Aldgate East (Hammersmith & City)" 1
         "Tower Hill (District)" 2
         "Whitechapel" 2)

   "Whitechapel"
   (hash "Aldgate East (District)" 2
         "Stepney Green" 2)

   "Stepney Green"
   (hash "Whitechapel" 2
         "Mile End (District)" 2)

   "Mile End (District)"
   (hash "Mile End (Central)" 1
         "Stepney Green" 2
         "Bow Road" 2)

   "Bow Road"
   (hash "Mile End (District)" 2
         "Bromley-by-Bow" 2)

   "Bromley-by-Bow"
   (hash "Bow Road" 2
         "West Ham (District)" 2)

   "West Ham (District)"
   (hash "West Ham (Jubilee)" 1
         "Bromley-by-Bow" 2
         "Plaistow" 1)

   "Plaistow"
   (hash "West Ham (District)" 1
         "Upton Park" 2)

   "Upton Park"
   (hash "Plaistow" 2
         "East Ham" 2)

   "East Ham"
   (hash "Upton Park" 2
         "Barking (District)" 3)

   "Barking (District)"
   (hash "East Ham" 3
         "Upney" 2)

   "Upney"
   (hash "Barking (District)" 2
         "Becontree" 3)

   "Becontree"
   (hash "Upney" 3
         "Dagenham Heathway" 2)

   "Dagenham Heathway"
   (hash "Becontree" 2
         "Dagenham East" 2)

   "Dagenham East"
   (hash "Dagenham Heathway" 2
         "Elm Park" 3)

   "Elm Park"
   (hash "Dagenham East" 3
         "Hornchurch" 2)

   "Hornchurch"
   (hash "Elm Park" 2
         "Upminster Bridge" 2)

   "Upminster Bridge"
   (hash "Hornchurch" 2
         "Upminster" 2)

   "Upminster"
   (hash "Upminster Bridge" 2)


   ; Hammersmith & City
   "Hammersmith (Hammersmith & City)"
   (hash "Hammersmith (District)" 1
         "Hammersmith (Piccadilly)" 1
         "Goldhawk Road" 2)
   
   "Goldhawk Road"
   (hash "Hammersmith (Hammersmith & City)" 2
         "Shepherd's Bush" 1)
   
   "Shepherd's Bush"
   (hash "Goldhawk Road" 1
         "Latimer Road" 2)
   
   "Latimer Road"
   (hash "Shepherd's Bush" 2
         "Ladbroke Grove" 1)
   
   "Ladbroke Grove"
   (hash "Latimer Road" 1
         "Westbourne Park" 2)
   
   "Westbourne Park"
   (hash "Ladbroke Grove" 2
         "Royal Oak" 2)
   
   "Royal Oak"
   (hash "Westbourne Park" 2
         "Paddington (Hammersmith & City)" 1)
   
   "Paddington (Hammersmith & City)"
   (hash "Royal Oak" 1
         "Edgware Road (Hammersmith & City)" 2)
   
   "Edgware Road (Hammersmith & City)"
   (hash "Edgware Road (Circle)" 1
         "Edgware Road (District)" 1
         "Paddington (Hammersmith & City)" 2
         "Baker Street (Hammersmith & City)" 2)
   
   "Baker Street (Hammersmith & City)"
   (hash "Baker Street (Circle)" 1
         "Baker Street (Bakerloo)" 1
         "Baker Street (Jubilee)" 1
         "Baker Street (Metropolitan)" 1
         "Edgware Road (Hammersmith & City)" 2
         "Great Portland Street (Hammersmith & City)" 2)
   
   "Great Portland Street (Hammersmith & City)"
   (hash "Baker Street (Hammersmith & City)" 2
         "Euston Square (Hammersmith & City)" 2)
   
   "Euston Square (Hammersmith & City)"
   (hash "Great Portland Street (Hammersmith & City)" 2
         "King's Cross St. Pancras (Hammersmith & City)" 2)
   
   "King's Cross St. Pancras (Hammersmith & City)"
   (hash "King's Cross St. Pancras (Northern)" 1
         "King's Cross St. Pancras (Piccadilly)" 1
         "King's Cross St. Pancras (Victoria)" 1
         "Euston Square (Hammersmith & City)" 2
         "Farringdon (Hammersmith & City)" 3)
   
   "Farringdon (Hammersmith & City)"
   (hash "King's Cross St. Pancras (Hammersmith & City)" 3
         "Barbican (Hammersmith & City)" 2)
   
   "Barbican (Hammersmith & City)"
   (hash "Farringdon (Hammersmith & City)" 2
         "Moorgate (Hammersmith & City)" 1)
   
   "Moorgate (Hammersmith & City)"
   (hash "Moorgate (Northern)" 1
         "Moorgate (Circle)" 1
         "Barbican (Hammersmith & City)" 1
         "Liverpool Street (Hammersmith & City)" 2)
   
   "Liverpool Street (Hammersmith & City)"
   (hash "Liverpool Street (Circle)" 1
         "Liverpool Street (Central)" 1
         "Moorgate (Hammersmith & City)" 2
         "Aldgate East (Hammersmith & City)" 2)
   
   "Aldgate East (Hammersmith & City)"
   (hash "Aldgate East (District)" 1
         "Liverpool Street (Hammersmith & City)" 2
         "Whitechapel" 2)
   
   "Whitechapel"
   (hash "Aldgate East (Hammersmith & City)" 2
         "Stepney Green" 2)
   
   "Stepney Green"
   (hash "Whitechapel" 2
         "Mile End (Hammersmith & City)" 2)
   
   "Mile End (Hammersmith & City)"
   (hash "Mile End (Central)" 1
         "Stepney Green" 2
         "Bow Road" 2)
   
   "Bow Road"
   (hash "Mile End (Hammersmith & City)" 2
         "Bromley-by-Bow" 2)
   
   "Bromley-by-Bow"
   (hash "Bow Road" 2
         "West Ham (Hammersmith & City)" 2)
   
   "West Ham (Hammersmith & City)"
   (hash "West Ham (Jubilee)" 1
         "Bromley-by-Bow" 2
         "Plaistow" 1)
   
   "Plaistow"
   (hash "West Ham (Hammersmith & City)" 1
         "Upton Park" 2)
   
   "Upton Park"
   (hash "Plaistow" 2
         "East Ham" 2)
   
   "East Ham"
   (hash "Upton Park" 2
         "Barking (Hammersmith & City)" 3)

   "Barking (Hammersmith & City)"
   (hash "Barking (District)" 1
         "East Ham" 3)


   ; Jubilee
   "Stratford (Jubilee)"
   (hash "Stratford (Central)" 1
         "West Ham (Jubilee)" 3)
   
   "West Ham (Jubilee)"
   (hash "West Ham (District)" 1
         "West Ham (Hammersmith & City)" 1
         "Stratford (Jubilee)" 3
         "Canning Town" 3)
   
   "Canning Town"
   (hash "West Ham (Jubilee)" 3
         "North Greenwich" 3)
   
   "North Greenwich"
   (hash "Canning Town" 3
         "Canary Wharf" 2)
   
   "Canary Wharf"
   (hash "North Greenwich" 2
         "Canada Water" 3)
   
   "Canada Water"
   (hash "Canary Wharf" 3
         "Bermondsey" 2)
   
   "Bermondsey"
   (hash "Canada Water" 2
         "London Bridge (Jubilee)" 3)
   
   "London Bridge (Jubilee)"
   (hash "London Bridge (Northern)" 1
         "Bermondsey" 3
         "Southwark" 2)
   
   "Southwark"
   (hash "London Bridge (Jubilee)" 2
         "Waterloo (Jubilee)" 1)
   
   "Waterloo (Jubilee)"
   (hash "Waterloo (Bakerloo)" 1
         "Waterloo (Northern)" 1
         "Waterloo (Waterloo & City)" 1
         "Southwark" 1
         "Westminster (Jubilee)" 2)
   
   "Westminster (Jubilee)"
   (hash "Westminster (Circle)" 1
         "Westminster (District)" 1
         "Waterloo (Jubilee)" 2
         "Green Park (Jubilee)" 3)
   
   "Green Park (Jubilee)"
   (hash "Green Park (Piccadilly)" 1
         "Green Park (Victoria)" 1
         "Westminster (Jubilee)" 3
         "Bond Street (Jubilee)" 2)
   
   "Bond Street (Jubilee)"
   (hash "Bond Street (Central)" 1
         "Green Park (Jubilee)" 2
         "Baker Street (Jubilee)" 3)
   
   "Baker Street (Jubilee)"
   (hash "Baker Street (Bakerloo)" 1
         "Baker Street (Circle)" 1
         "Baker Street (Hammersmith & City)" 1
         "Baker Street (Metropolitan)" 1
         "Bond Street (Jubilee)" 3
         "St. Johns Wood" 3)
   
   "St. Johns Wood"
   (hash "Baker Street (Jubilee)" 3
         "Swiss Cottage" 2)
   
   "Swiss Cottage"
   (hash "St. Johns Wood" 2
         "Finchley Road (Jubilee)" 2)
   
   "Finchley Road (Jubilee)"
   (hash "Finchley Road (Metropolitan)" 1
         "Swiss Cottage" 2
         "West Hampstead" 1)
   
   "West Hampstead"
   (hash "Finchley Road (Jubilee)" 1
         "Kilburn" 2)
   
   "Kilburn"
   (hash "West Hampstead" 2
         "Willesden Green" 2)
   
   "Willesden Green"
   (hash "Kilburn" 2
         "Dollis Hill" 2)
   
   "Dollis Hill"
   (hash "Willesden Green" 2
         "Neasden" 2)
   
   "Neasden"
   (hash "Dollis Hill" 2
         "Wembley Park (Jubilee)" 3)
   
   "Wembley Park (Jubilee)"
   (hash "Wembley Park (Metropolitan)" 1
         "Neasden" 3
         "Kingsbury" 4)
   
   "Kingsbury"
   (hash "Wembley Park (Jubilee)" 4
         "Queensbury" 2)
   
   "Queensbury"
   (hash "Kingsbury" 2
         "Canons Park" 3)
   
   "Canons Park"
   (hash "Queensbury" 3
         "Stanmore" 2)
   
   "Stanmore"
   (hash "Canons Park" 2)


   ; Metropolitan
   "Chesham"
   (hash "Chalfont & Latimer" 8)
   
   "Chalfont & Latimer"
   (hash "Chesham" 8
         "Amersham" 4
         "Chorleywood" 4)
   
   "Amersham"
   (hash "Chalfont & Latimer" 4)
   
   "Chorleywood"
   (hash "Chalfont & Latimer" 4
         "Rickmansworth" 4)
   
   "Rickmansworth"
   (hash "Chorleywood" 4
         "Moor Park" 4)
   
   "Moor Park"
   (hash "Rickmansworth" 4
         "Croxley" 4
         "Northwood" 3)
   
   "Croxley"
   (hash "Moor Park" 4
         "Watford" 3)
   
   "Watford"
   (hash "Croxley" 3)
   
   "Northwood"
   (hash "Moor Park" 3
         "Northwood Hills" 2)
   
   "Northwood Hills"
   (hash "Northwood" 2
         "Pinner" 3)
   
   "Pinner"
   (hash "Northwood Hills" 3
         "North Harrow" 2)
   
   "North Harrow"
   (hash "Pinner" 2
         "Harrow-on-the-Hill" 3)
   
   "Harrow-on-the-Hill"
   (hash "North Harrow" 3
         "West Harrow" 2)
   
   "West Harrow"
   (hash "Harrow-on-the-Hill" 2
         "Rayners Lane (Metropolitan)" 3)
   
   "Rayners Lane (Metropolitan)"
   (hash "Rayners Lane (Piccadilly)" 1
         "West Harrow" 3
         "Eastcote" 2)
   
   "Eastcote"
   (hash "Rayners Lane (Metropolitan)" 2
         "Ruislip Manor" 2)
   
   "Ruislip Manor"
   (hash "Eastcote" 2
         "Ruislip" 2)
   
   "Ruislip"
   (hash "Ruislip Manor" 2
         "Ickenham" 3)
   
   "Ickenham"
   (hash "Ruislip" 3
         "Hillingdon" 2)
   
   "Hillingdon"
   (hash "Ickenham" 2
         "Uxbridge" 3)
   
   "Harrow-on-the-Hill"
   (hash "Northwick Park" 3)
   
   "Northwick Park"
   (hash "Harrow-on-the-Hill" 3
         "Preston Road" 2)
   
   "Preston Road"
   (hash "Northwick Park" 2
         "Wembley Park (Metropolitan)" 3)
   
   "Wembley Park (Metropolitan)"
   (hash "Wembley Park (Jubilee)" 1
         "Preston Road" 3
         "Finchley Road (Metropolitan)" 7)
   
   "Finchley Road (Metropolitan)"
   (hash "Finchley Road (Jubilee)" 1
         "Wembley Park (Metropolitan)" 7
         "Baker Street (Metropolitan)" 6)
   
   "Baker Street (Metropolitan)"
   (hash "Baker Street (Bakerloo)" 1
         "Baker Street (Circle)" 1
         "Baker Street (Hammersmith & City)" 1
         "Baker Street (Jubilee)" 1
         "Finchley Road (Metropolitan)" 6
         "Great Portland Street" 2)
   
   "Great Portland Street"
   (hash "Baker Street (Metropolitan)" 2
         "Euston Square" 2)
   
   "Euston Square"
   (hash "Great Portland Street" 2
         "King's Cross St. Pancras (Metropolitan)" 2)
   
   "King's Cross St. Pancras (Metropolitan)"
   (hash "King's Cross St. Pancras (Northern)" 1
         "King's Cross St. Pancras (Piccadilly)" 1
         "King's Cross St. Pancras (Victoria)" 1
         "Euston Square" 2
         "Farringdon" 3)
   
   "Farringdon"
   (hash "King's Cross St. Pancras (Metropolitan)" 3
         "Barbican" 2)
   
   "Barbican"
   (hash "Farringdon" 2
         "Moorgate (Metropolitan)" 1)
   
   "Moorgate (Metropolitan)"
   (hash "Moorgate (Northern)" 1
         "Barbican" 1
         "Liverpool Street (Metropolitan)" 2)
   
   "Liverpool Street (Metropolitan)"
   (hash "Liverpool Street (Central)" 1
         "Liverpool Street (Circle)" 1
         "Liverpool Street (Hammersmith & City)" 1
         "Moorgate (Metropolitan)" 2
         "Aldgate" 2)
   
   "Aldgate"
   (hash "Liverpool Street (Metropolitan)" 2)


   ; Piccadilly
   "Uxbridge"
   (hash "Hillingdon" 3)
   
   "Hillingdon"
   (hash "Uxbridge" 3
         "Ickenham" 2)
   
   "Ickenham"
   (hash "Hillingdon" 2
         "Ruislip" 3)
   
   "Ruislip"
   (hash "Ickenham" 3
         "Ruislip Manor" 2)
   
   "Ruislip Manor"
   (hash "Ruislip" 2
         "Eastcote" 2)
   
   "Eastcote"
   (hash "Ruislip Manor" 2
         "Rayners Lane (Piccadilly)" 2)
   
   "Rayners Lane (Piccadilly)"
   (hash "Rayners Lane (Metropolitan)" 1
         "Eastcote" 2
         "South Harrow" 3)
   
   "South Harrow"
   (hash "Rayners Lane (Piccadilly)" 3
         "Sudbury Hill" 3)
   
   "Sudbury Hill"
   (hash "South Harrow" 3
         "Sudbury Town" 2)
   
   "Sudbury Town"
   (hash "Sudbury Hill" 2
         "Alperton" 2)
   
   "Alperton"
   (hash "Sudbury Town" 2
         "Park Royal" 3)
   
   "Park Royal"
   (hash "Alperton" 3
         "North Ealing" 2)
   
   "North Ealing"
   (hash "Park Royal" 2
         "Ealing Common (Piccadilly)" 2)
   
   "Ealing Common (Piccadilly)"
   (hash "Ealing Common (District)" 1
         "North Ealing" 2
         "Acton Town (Piccadilly)" 2)
   
   "Acton Town (Piccadilly)"
   (hash "Acton Town (District)" 1
         "Ealing Common (Piccadilly)" 2
         "South Ealing" 3
         "Turnham Green" 3)
   
   "South Ealing"
   (hash "Acton Town (Piccadilly)" 3
         "Northfields" 1)
   
   "Northfields"
   (hash "South Ealing" 1
         "Boston Manor" 2)
   
   "Boston Manor"
   (hash "Northfields" 2
         "Osterley" 3)
   
   "Osterley"
   (hash "Boston Manor" 3
         "Hounslow East" 2)
   
   "Hounslow East"
   (hash "Osterley" 2
         "Hounslow Central" 1)
   
   "Hounslow Central"
   (hash "Hounslow East" 1
         "Hounslow West" 2)
   
   "Hounslow West"
   (hash "Hounslow Central" 2
         "Hatton Cross" 4)
   
   "Hatton Cross"
   (hash "Hounslow West" 4
         "Heathrow Terminal 4" 2)
   
   "Heathrow Terminal 4"
   (hash "Hatton Cross" 2
         "Heathrow Terminals 1, 2, 3" 5)
   
   "Heathrow Terminals 1, 2, 3"
   (hash "Heathrow Terminal 4" 5
         "Hatton Cross" 3)
   
   "Turnham Green"
   (hash "Acton Town (Piccadilly)" 3
         "Hammersmith (Piccadilly)" 4)
   
   "Hammersmith (Piccadilly)"
   (hash "Hammersmith (District)" 1
         "Hammersmith (Hammersmith & City)" 1
         "Turnham Green" 4
         "Barons Court (Piccadilly)" 2)
   
   "Barons Court (Piccadilly)"
   (hash "Barons Court (District)" 1
         "Hammersmith (Piccadilly)" 2
         "Earl's Court (Piccadilly)" 3)
   
   "Earl's Court (Piccadilly)"
   (hash "Earl's Court (District)" 1
         "Barons Court (Piccadilly)" 3
         "Gloucester Road (Piccadilly)" 2)
   
   "Gloucester Road (Piccadilly)"
   (hash "Gloucester Road (Circle)" 1
         "Earl's Court (Piccadilly)" 2
         "South Kensington (Piccadilly)" 1)
   
   "South Kensington (Piccadilly)"
   (hash "South Kensington (Circle)" 1
         "South Kensington (District)" 1
         "Gloucester Road (Piccadilly)" 1
         "Knightsbridge" 3)
   
   "Knightsbridge"
   (hash "South Kensington (Piccadilly)" 3
         "Hyde Park Corner" 1)
   
   "Hyde Park Corner"
   (hash "Knightsbridge" 1
         "Green Park (Piccadilly)" 2)
   
   "Green Park (Piccadilly)"
   (hash "Green Park (Jubilee)" 1
         "Green Park (Victoria)" 1
         "Hyde Park Corner" 2
         "Piccadilly Circus (Piccadilly)" 1)
   
   "Piccadilly Circus (Piccadilly)"
   (hash "Piccadilly Circus (Bakerloo)" 1
         "Green Park (Piccadilly)" 1
         "Leicester Square (Piccadilly)" 2)
   
   "Leicester Square (Piccadilly)"
   (hash "Leicester Square (Northern)" 1
         "Piccadilly Circus (Piccadilly)" 2
         "Covent Garden" 1)
   
   "Covent Garden"
   (hash "Leicester Square (Piccadilly)" 1
         "Holborn (Piccadilly)" 2)
   
   "Holborn (Piccadilly)"
   (hash "Holborn (Central)" 1
         "Covent Garden" 2
         "Russell Square" 1)
   
   "Russell Square"
   (hash "Holborn (Piccadilly)" 1
         "King's Cross St. Pancras (Piccadilly)" 2)
   
   "King's Cross St. Pancras (Piccadilly)"
   (hash "King's Cross St. Pancras (Circle)" 1
         "King's Cross St. Pancras (Hammersmith & City)" 1
         "King's Cross St. Pancras (Metropolitan)" 1
         "King's Cross St. Pancras (Northern)" 1
         "King's Cross St. Pancras (Victoria)" 1
         "Russell Square" 2
         "Caledonian Road" 3)
   
   "Caledonian Road"
   (hash "King's Cross St. Pancras (Piccadilly)" 3
         "Holloway Road" 1)
   
   "Holloway Road"
   (hash "Caledonian Road" 1
         "Arsenal" 2)
   
   "Arsenal"
   (hash "Holloway Road" 2
         "Finsbury Park (Piccadilly)" 1)
   
   "Finsbury Park (Piccadilly)"
   (hash "Finsbury Park (Victoria)" 1
         "Arsenal" 1
         "Manor House" 2)
   
   "Manor House"
   (hash "Finsbury Park (Piccadilly)" 2
         "Turnpike Lane" 3)
   
   "Turnpike Lane"
   (hash "Manor House" 3
         "Wood Green" 2)
   
   "Wood Green"
   (hash "Turnpike Lane" 2
         "Bounds Green" 2)
   
   "Bounds Green"
   (hash "Wood Green" 2
         "Arnos Grove" 3)

   "Arnos Grove"
   (hash "Bounds Green" 3
         "Southgate" 3)

   "Southgate"
   (hash "Arnos Grove" 3
         "Oakwood" 3)

   "Oakwood"
   (hash "Southgate" 3
         "Cockfosters" 2)

   "Cockfosters"
   (hash "Oakwood" 2)


   ; Victoria
   "Walthamstow Central"
   (hash "Blackhorse Road" 2)

   "Blackhorse Road"
   (hash "Walthamstow Central" 2
         "Tottenham Hale" 2)
   
   "Tottenham Hale"
   (hash "Blackhorse Road" 2
         "Seven Sisters" 2)
   
   "Seven Sisters"
   (hash "Tottenham Hale" 2
         "Finsbury Park (Victoria)" 4)
   
   "Finsbury Park (Victoria)"
   (hash "Finsbury Park (Piccadilly)" 1
         "Seven Sisters" 4
         "Highbury & Islington" 3)
   
   "Highbury & Islington"
   (hash "Finsbury Park (Victoria)" 3
         "King's Cross St. Pancras (Victoria)" 3)
   
   "King's Cross St. Pancras (Victoria)"
   (hash "King's Cross St. Pancras (Circle)" 1
         "King's Cross St. Pancras (Hammersmith & City)" 1
         "King's Cross St. Pancras (Metropolitan)" 1
         "King's Cross St. Pancras (Northern)" 1
         "King's Cross St. Pancras (Piccadilly)" 1
         "Highbury & Islington" 3
         "Euston (Victoria)" 2)
   
   "Euston (Victoria)"
   (hash "Euston (Northern)" 1
         "King's Cross St. Pancras (Victoria)" 2
         "Warren Street (Victoria)" 1)
   
   "Warren Street (Victoria)"
   (hash "Warren Street (Northern)" 1
         "Euston (Victoria)" 1
         "Oxford Circus (Victoria)" 2)
   
   "Oxford Circus (Victoria)"
   (hash "Oxford Circus (Bakerloo)" 1
         "Oxford Circus (Central)" 1
         "Warren Street (Victoria)" 2
         "Green Park (Victoria)" 2)
   
   "Green Park (Victoria)"
   (hash "Green Park (Jubilee)" 1
         "Green Park (Piccadilly)" 1
         "Oxford Circus (Victoria)" 2
         "Victoria (Victoria)" 2)
   
   "Victoria (Victoria)"
   (hash "Victoria (Circle)" 1
         "Victoria (District)" 1
         "Green Park (Victoria)" 2
         "Pimlico" 2)
   
   "Pimlico"
   (hash "Victoria (Victoria)" 2
         "Vauxhall" 1)
   
   "Vauxhall"
   (hash "Pimlico" 1
         "Stockwell (Victoria)" 3)
   
   "Stockwell (Victoria)"
   (hash "Stockwell (Northern)" 1
         "Vauxhall" 3
         "Brixton" 2)
   
   "Brixton"
   (hash "Stockwell (Victoria)" 2)


   ; Waterloo & City
   "Waterloo (Waterloo & City)"
   (hash "Waterloo (Bakerloo)" 1
         "Waterloo (Jubilee)" 1
         "Waterloo (Northern)" 1
         "Bank (Waterloo & City)" 4)

   "Bank (Waterloo & City)"
   (hash "Bank (Central)" 1
         "Monument (Circle)" 1
         "Monument (District)" 1
         "Bank (Northern)" 1
         "Waterloo (Waterloo & City)" 4)
   ))

(provide tfl-line)