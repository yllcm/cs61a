(define (over-or-under num1 num2) 'YOUR-CODE-HERE
  (cond ((< num1 num2) -1) 
        ((= num1 num2) 0)
        ((> num1 num2) 1)))

(define (make-adder num) 'YOUR-CODE-HERE
  (define (adder inc) (+ inc num)) adder)

(define (composed f g) 'YOUR-CODE-HERE
  (define (h arg) (f (g arg))) h)

(define (repeat f n) 'YOUR-CODE-HERE
  (define (g x)
    (define (h n x)
      (if (= n 0) x (f (h (- n 1) x))))
    (h n x))
  g)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 'YOUR-CODE-HERE
  (define (helper a b)
    (if (zero? (modulo a b)) b (helper b (modulo a b))))
  (helper (max a b) (min a b)))
