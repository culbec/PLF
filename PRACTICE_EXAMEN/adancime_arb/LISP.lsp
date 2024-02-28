(defun sau (L)
    (cond
        ((null L) nil)
        (t (or (car L) (sau (cdr L))))
    )
)

(defun exista (L E)
    (cond
        ((null L) nil)
        ((eq (car L) E) t)
        (t (funcall #'sau (mapcar #'(lambda (x) (exista x E)) (cdr L))))
    )
)

(defun depth-aux (Arb)
    (cond
        ((atom Arb) 0)
        (t (+ 1 (apply #'max (mapcar #'depth-aux Arb))))
    )
)

(defun depth (Arb)
    (cond
        ((listp Arb) (apply #'max (mapcar #'depth-aux Arb)))
        (t nil)
    )
)

(defun depth-e-aux (Arb E)
    (cond
        ((and (atom Arb) (eq Arb E)) -1)
        ((and (atom Arb) (not (eq Arb E))) 0)
        ((and (listp Arb) (exista Arb E)) (+ 1 (apply #'+ (mapcar #'(lambda (x) (depth-e-aux x E)) Arb))))
        (t 0)
    )
)

(defun depth-e (Arb E)
    (cond
        ((and (listp Arb) (exista Arb E)) (- (depth Arb) (depth-e-aux Arb E)))
        (t -1)
    )
)