(defun G(L)
  (+ (car L) (cadr L))
)

(defun dubleazaNAux (L N I)
  (cond
    ((null L) nil)
    ((= (mod I N) 0) (append (list (car L)) (list (car L)) (dubleazaNAux (cdr L) N (+ 1 I))))
    (t (append (list (car L)) (dubleazaNAux (cdr L) N (+ 1 I))))
  )
)

(defun dubleazaN (L N)
  (dubleazaNAux L N 1)
)

(defun extrage-numerici (L)
  (cond
    ((numberp L) (list L))
    ((listp L) (apply #'append (mapcar #'extrage-numerici L)))
    (t nil)
  )
)

(defun ultim-impar (L)
  (cond
    ((null L) 0)
    ((not (null (cdr L))) (ultim-impar (cdr L)))
    (t
     (cond
      ((= (mod (car L) 2) 1) 1)
      (t 0)
     )
    )
  )
)

(defun subliste (L)
  (cond
    ((atom L) 0)
    (t 
     (+ (ultim-impar (extrage-numerici L)) (apply #'+ (mapcar #'subliste L)))
    )
  )
)
