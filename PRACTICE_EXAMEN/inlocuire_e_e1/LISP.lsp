(defun inlocuire (L E E1)
    (cond
        ((and (atom L) (eq L E)) E1)
        ((and (atom L) (not (eq L E))) L)
        (t (mapcar #'(lambda (x) (inlocuire x E E1)) L))
    )
)

(defun f(l)
    (cond
        ((atom l) -1)
        (t ((lambda (x)
                        (cond
                            ((> x 0) (+ (car l) x (f (cdr l))))
                            (t (f (cdr l)))
                        )
                      ) (f (car l))
           )
        )
    )
)