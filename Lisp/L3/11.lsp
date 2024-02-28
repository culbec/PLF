(defun stergeAux (L E)
  (cond
    ((atom L)
     (cond
        ((eq L E) nil)
        (t (list L))
     )
    )
    ((listp L) (list (apply #'append (mapcar #'(lambda (x) (stergeAux x E)) L))))
  )
)

(defun sterge (L E)
  (cond
    ((and (listp L) (atom E)) (apply #'append (mapcar #'(lambda (x) (stergeAux x E)) L)))
    (t nil)
  )
)
