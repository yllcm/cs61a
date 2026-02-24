(define (ascending? s) 'YOUR-CODE-HERE
  (if (or (null? s) (null? (cdr s))) #t
      (and (<= (car s) (car (cdr s))) (ascending? (cdr s)))))

(define (my-filter pred s) 'YOUR-CODE-HERE
  (cond ((null? s) nil)
        ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
        (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) 'YOUR-CODE-HERE
  (if (or (null? lst1) (null? lst2)) (append lst1 lst2)
      (cons (car lst1) (interleave lst2 (cdr lst1)))))

(define (no-repeats s) 'YOUR-CODE-HERE
  (begin
    (define (appear? x s)
      (if (null? s) #f
          (or (= x (car s)) (appear? x (cdr s)))))
    (define answer nil)
    (define (add x) (set! answer (append answer (list x))))
    (define (helper s)
      (if (not (null? s))
        (begin
          (if (not (appear? (car s) answer)) (add (car s))) 
          (helper (cdr s))
        )
      )
    )
    (helper s)
    answer
  )
)
