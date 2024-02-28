(defun exista (L E)
    (cond
        ((null L) nil)
        ((eq (car L) E) (list E))
        (t (funcall #'sau (mapcar #'(lambda (x) (exista x E)) (cdr L))))
    )
)

(defun path (L E)
    (cond
        ((and (listp L) (exista L E))
         (append (list (car L)) (mapcan #'(lambda (x) (path x E)) (cdr L)))
        )
        (t nil)
    )
)