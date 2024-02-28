(defun replace_on_level_k_main (L K)
    (cond
        ((null L) nil)
        ((atom L) nil)
        (t (apply #'append (mapcar #'(lambda (x) (replace_on_level_k x K 1)) L)))
    )
)

(defun replace_on_level_k (L K CurrLevel)
    (cond
        ((null L) nil)
        (
            (= K CurrLevel)
            (cond
                ((atom L) (list 0)) ; append intre liste
                (t (list L)) ; retinem lista intr-o alta lista pentru append
            )
        ) ; case where we are on the K level.
        (
            t
            (cond
                ((atom L) (list L))
                (t (list (apply #'append (mapcar #'(lambda (x) (replace_on_level_k x K (+ 1 CurrLevel))) L))))
            )
        ) ; going deeper on each list inside the list if necessary
    )
)
