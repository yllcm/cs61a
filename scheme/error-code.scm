(define (sum n total)
  (or (and (zero? n) total)
      (add n (+ n total))))

(define add (lambda (x+1 y) (sum (- x+1 1) y)))