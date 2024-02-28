(defun replace_aux (L E L1)
  (cond
    ((atom L)
     (cond
      ((eq L E) L1)
      (t (list L))
     )
    )
    ((listp L) (list (apply #'append (mapcar #'(lambda (y) (replace_aux y E L1)) L))))
  )
)

(defun replace_e (L E L1)
  (cond
    ((listp L) (apply #'append (mapcar #'(lambda (x) (replace_aux x E L1)) L)))
    (t nil)
  )
)
