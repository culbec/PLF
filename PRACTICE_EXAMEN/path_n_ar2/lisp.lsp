(defun exista (L E)
    (cond
        ((null L) nil)
        ((and (atom (car L)) (eq (car L) E)) t)
        ((listp (car L)) (or (exista (car L) E) (exista (cdr L) E)))
        (t (exista (cdr L) E))
    )
)

(defun path (L E)
    (cond
        ((and (atom L) (eq L E)) E)
        ((and (listp L) (exista L E)) (append (list (car L)) (apply #'append (mapcar #'(lambda (x) (path x E)) (cdr L)))))
        (t nil)
    )
)