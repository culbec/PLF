(defun subs-aux (L K Niv)
    (cond
        ((and (atom L) (= K Niv)) (list 0))
        ((and (atom L) (not (= K Niv))) (list L))
        (t (list (apply #'append (mapcar #'(lambda (x) (subs-aux x K (+ 1 Niv))) L))))
    )
)

(defun subs (L K)
    (cond
        ((listp L) (apply #'append (mapcar #'(lambda (x) (subs-aux x K 1)) L)))
        (t nil)
    )
)