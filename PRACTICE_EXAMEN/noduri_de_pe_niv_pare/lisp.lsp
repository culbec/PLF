(defun noduri-niv-pare (L)
    (cond
        ((listp L) (apply #'append (mapcar #'(lambda (x) (noduri-niv-pare-aux x 0)) L)))
        (t nil)
    )
)

(defun noduri-niv-pare-aux (L Niv)
    (cond
        ((and (atom L) (= (mod Niv 2) 0)) (list L))
        ((and (atom L) (= (mod Niv 2) 1)) nil)
        (t (apply #'append (mapcar #'(lambda (x) (noduri-niv-pare-aux x (+ 1 Niv))) L)))
    )
)