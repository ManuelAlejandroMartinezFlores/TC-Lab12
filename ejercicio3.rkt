#lang racket

; Matrix transpose using only lambda functions
(((lambda (transpose)
    (lambda (matrix)
      (transpose transpose matrix)))
  (lambda (self matrix)
    (if (null? (car matrix))
        '()
        (cons
         ; Get first element of each row
         ((lambda (map-car)
            (map-car map-car matrix))
          (lambda (self lst)
            (if (null? lst)
                '()
                (cons (car (car lst))
                      (self self (cdr lst))))))
         ; Recursively transpose the rest
         (self self
               ; Get tail of each row
               ((lambda (map-cdr)
                  (map-cdr map-cdr matrix))
                (lambda (self lst)
                  (if (null? lst)
                      '()
                      (cons (cdr (car lst))
                            (self self (cdr lst)))))))))))
 '((1 2 3)
   (4 5 6)
   (7 8 9)))