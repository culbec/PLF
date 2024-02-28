(defun replaceAux (L E A)
  (cond
    ((atom L)
     (cond
      ((eq L E) (list A))
      (t (list L))
     )
    )
    ((listp L) (list (apply #'append (mapcar #'(lambda (x) (replaceAux x E A)) L))))
  )
)

(defun myReplace (L E A)
  (cond
    ((and (listp L) (atom E) (atom A)) (apply #'append (mapcar #'(lambda (x) (replaceAux x E A)) L)))
    (t nil)
  )
)
