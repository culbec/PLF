(defun f (L1 L2)
    (append (f (car L1) L2)
        (cond
            ((null L1) (cdr L2))
            (t (list (f (car L1) L2) (car L2)))
        )
    )
)