(defun maxi (L)
  (cond
    ((null (cdr L)) (car L))
    (t (max (car L) (maxi (cdr L))))
  )
)

(defun max_numeric (L)
  (cond
    ((numberp L) (list L))
    ; liniarizam pe L, extragand atomii numerici din el
    ((listp L) (funcall #'maxi (apply #'append (mapcar #'max_atom L))))
    (t nil)
  )
)
