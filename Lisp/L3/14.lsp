(defun depthAux (L)
  (cond
    ((atom L) (list 0))
    ((listp L) (list (+ 1 (apply #'max (mapcan #'depthAux L)))))
  )
)

(defun depth(L)
  (cond
    ((listp L) (apply #'max (mapcan #'depthAux L)))
    (t nil)
  )
)
