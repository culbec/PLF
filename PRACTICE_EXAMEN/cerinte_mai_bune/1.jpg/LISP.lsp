(defun exists(Arb Nod)
    (cond
        ((null Arb) nil)
        ((eq (car Arb) Nod) (list t))
        (t (or (apply #'append(mapcar #'(lambda (x) (exists x Nod)) (cdr Arb)))))
    )
)

(defun path (Arb Nod)
    (cond
      (
        (and (listp Arb) (exists Arb Nod))
        (append (list (car Arb)) (apply #'append(mapcar #'(lambda (x) (path x Nod)) (cdr Arb))))
      )
      (t nil)
    )
)

(defun apartine (Arb Nod)
    (cond
      ((null Arb) nil)
      ((eq (car Arb) Nod) (list Nod))
      (t (or (apartine (cadr Arb) Nod) (apartine (caddr Arb) Nod)))
    )
)

(defun pathBinar (Arb Nod)
    (cond
      ((and (listp Arb) (apartine Arb Nod))
       (append (list (car Arb)) (pathBinar (cadr Arb) Nod) (pathBinar (caddr Arb) Nod))
      )
      (t nil)
    )
)

; Extrage lista atomilor numerici de la orice nivel din lista neliniara L primita ca parametru.
(defun extrage_atomi_numerici (L)
    (cond
      ((numberp L) (list L))
      ((listp L) (apply #'append (mapcar #'extrage_atomi_numerici L)))
      (t nil)
    )
)

(defun valid (L)
  (cond
    ((listp L)
     (cond
        ((= (mod (car L) 2) 1) 1)
        (t 0)
     )
    )
    (t nil)
  )
)

(defun subliste (L)
  (cond
    ((listp L)
     (+ (valid (extrage_atomi_numerici L))
        ; FARA APPEND DEOARECE + va lua fiecare forma pe rand asa cum ii este passuita!!!!!
        (apply #'+ (mapcar #'subliste L))
     )
    )
    (t 0)
  )
)
