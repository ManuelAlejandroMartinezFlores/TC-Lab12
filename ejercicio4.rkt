#lang racket

; List difference: return items from first list that aren't in second list
; Using only lambda functions
(((lambda (difference)
    (lambda (lst1 lst2)
      (difference difference lst1 lst2)))
  (lambda (self lst1 lst2)
    (if (null? lst1)
        '()
        ((lambda (current rest)
           ((lambda (contains?)
              (if (contains? contains? lst2 current)
                  (self self rest lst2)
                  (cons current (self self rest lst2))))
            (lambda (self-contains lst item)
              (if (null? lst)
                  #f
                  (if (equal? (car lst) item)
                      #t
                      (self-contains self-contains (cdr lst) item))))))
         (car lst1)
         (cdr lst1)))))
 '(1 2 3 4 5 7)
 '(2 4 6))