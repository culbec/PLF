(defun remove_e_aux (L E)
  (cond
    ((and (atom L) (not (equal L E))) (list L))
    ((listp L) (list (apply #'append (mapcar #'(lambda (x) (remove_e_aux x E)) L))))
    (t nil)
  )
)

(defun remove_e (L E)
  (cond
    ((listp L) (apply #'append (mapcar #'(lambda (x) (remove_e_aux x E)) L)))
    (t nil)
  )
)

(defun extract-atoms (L)
  (cond
    ((atom L) (list L))
    (t (apply #'append (mapcar #'extract-atoms L)))
  )
)

(defun valid (L)
  (cond
    ((null L) 0)
    ((and (null (cdr L)) (not (numberp (car L)))) 1)
    (t (valid (cdr L)))
  )
)

(defun sublists (L)
  (cond
    ((atom L) 0)
    (t (+ (valid (extract-atoms L)) (apply #'+ (mapcar #'sublists L))))
  )
)
