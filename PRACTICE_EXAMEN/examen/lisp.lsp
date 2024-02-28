(defun f (l e)
    (list L E)
)

(defun g (l)
    (cond
        ((null l) nil)
        ((listp l) (funcall #'(lambda (x) (append x (g (cdr l)) (list (car x)))) (g (car l))))
        (t (list (car l)))
    )
)

(defun sau (l)
    (cond
        ((null l) nil)
        (t (or (car l) (sau (cdr l))))
    )
)

(defun exista (l e)
    (cond
        ((and (atom l) (eq l e)) t)
        ((and (atom l) (not (eq l e))) nil)
        (t (funcall #'sau (mapcar #'(lambda (x) (exista x e)) l)))
    )
)