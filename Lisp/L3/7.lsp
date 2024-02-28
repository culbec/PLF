(defun sd (L)
  (cond
    ((numberp L)
     (cond
        ((= (mod L 2) 1) (- 0 L))
        (t L)
     )
    )
    ((listp L) (apply #'+ (mapcar #'sd L)))
    (t 0)
  )
)
