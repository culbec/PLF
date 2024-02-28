(defun produs_atomi (L)
  (cond
    ((numberp L) L)
    ((listp L) (apply #'* (mapcar #'produs_atomi L)))
    (t 1)
  )
)
