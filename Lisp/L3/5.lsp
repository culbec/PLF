(defun exista (E Nod)
  (cond
    ((atom E)
     (cond
      ((eq E Nod) t)
      (t nil)
     )
    )
    ((listp E) (or (exista (car E) Nod) (exista (cdr E) Nod)))
    (t nil)
  )
)

(defun valid (L)
  (cond
    ((null (cdr L)) (car L))
    (t (or (car L) (valid (cdr L))))
  )
)

(defun exista_nod (Arb Nod)
  (cond
    ((listp Arb) (apply #'valid (list (mapcar #'(lambda (x) (exista x Nod)) Arb))))
    (t nil)
  )
)
