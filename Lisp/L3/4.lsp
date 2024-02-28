(defun suma_atomi (L)
  (cond
    ((numberp L) L)
    ((listp L) (apply #'+ (mapcar #'suma_atomi L)))
    (t 0)
  )
)
