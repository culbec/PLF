(defun exista (L E)
  (cond
    ((atom L)
     (cond 
        ((eq L E) t)
        (t nil)
     )
    )
    ((listp L) (or (mapcan #'(lambda (x) (exista x E)) L)))
  )
)
