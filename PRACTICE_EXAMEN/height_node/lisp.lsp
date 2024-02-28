(defun height-aux (L E Gasit)
    (cond
        ((null L) 0)
        ((atom L) 0)
        ((and (not (eq (car L) E)) (= Gasit 0)) (apply #'max (mapcar #'(lambda (x) (height-aux x E Gasit)) L)))
        ((and (not (eq (car L) E)) (= Gasit 1)) (+ 1 (apply #'max (mapcar #'(lambda (x) (height-aux x E Gasit)) L))))
        ((and (eq (car L) E) (= Gasit 0)) (+ 1 (apply #'max (mapcar #'(lambda (x) (height-aux x E 1)) L))))
        (t (apply #'max (mapcar #'(lambda (x) (height-aux x E Gasit)) L)))
    ) 
)

(defun height (L E)
    (cond
        ((and (listp L) (atom E)) (height-aux L E 0))
        (t -1)
    )
)