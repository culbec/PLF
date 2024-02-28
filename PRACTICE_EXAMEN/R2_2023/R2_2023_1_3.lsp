(defun F (X &REST Y)
    (cond
        ((null Y) X)
        (t (append X (mapcar #'car Y)))
    )
)
