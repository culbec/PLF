(defun substituie (L E E1)
    (cond
        ((listp L) (apply #'append (mapcar #'(lambda (x) (substituieA x E E1 1)) L)))
        (t nil)
    )
)

(defun substituieA (L E E1 Niv)
    (cond
        ((and (atom L) (not (eq L E))) (list L))
        ((and (atom L) (eq L E) (= (mod Niv 2) 1)) (list E1))
        ((and (atom L) (eq L E) (= (mod Niv 2) 0)) (list L))
        (t (list (apply #'append (mapcar #'(lambda (x) (substituieA x E E1 (+ 1 Niv))) L))))
    )
)