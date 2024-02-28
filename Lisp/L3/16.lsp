(defun inversAux (L)
  (cond
    ((null L) nil)
    (t (append (inversAux (cdr L)) (list (car L)))) 
  )
)

(defun invers (L)
  (cond
    ((atom L) (list L))
    ((listp L) (list (mapcan #'invers (inversAux L))))
    (t nil)
  )
)
