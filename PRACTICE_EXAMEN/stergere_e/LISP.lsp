(defun prelucrare (L E)
    (cond
        ((and (atom L) (eq L E)) nil)
        ((and (atom L) (not (eq L E))) (list L))
        (t (list (apply #'append (mapcar #'(lambda (x) (prelucrare x E)) L))))
    )
)

(defun sterge (L E)
    (cond
        ((listp L) (apply #'append (mapcar #'(lambda (x) (prelucrare x E)) L)))
        (t L)
    )
)