(defun exista (L E)
    (cond
        ((listp L) (funcall #'sau (mapcar #'(lambda (x) (existaAux x E 0)) L)))
        (t nil)
    )
)

(defun existaAux (L E N)
    (cond
        ((and (atom L) (eq L E) (= (mod N 2) 0)) t)
        ((and (atom L) (eq L E) (= (mod N 2) 1)) nil)
        ((and (atom L) (not (eq L E))) nil)
        (t (funcall #'sau (mapcar #'(lambda (x) (existaAux x E (+ 1 N))) L)))
    )
)

(defun sau (L)
    (cond
        ((null L) nil)
        (t (or (car L) (sau (cdr L))))
    )
)