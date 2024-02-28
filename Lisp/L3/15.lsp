(defun nr_atomi_aux (L)
  (cond
    ((atom L) (list 1))
    ((listp L) (list (apply #'+ (mapcan #'nr_atomi_aux L))))
  )
)

(defun nr_atomi (L)
  (cond
    ((listp L) (apply #'+ (mapcan #'nr_atomi_aux L)))
    (t nil)
  )
)
