(defun replace-arb (Arb K E)
  (cond 
    ((listp Arb) (apply #'append (mapcar #'(lambda (x) (replace-arb-aux x K E 0)) Arb)))
    (t nil)
  )
)

(defun replace-arb-aux (Arb K E N)
  (cond
    ((and (atom Arb) (= N K)) (list E))
    ((and (atom Arb) (not (= N K))) (list Arb))
    (t (list (apply #'append (mapcar #'(lambda (x) (replace-arb-aux x K E (+ 1 N))) Arb))))
  )
)

(defun extrage-numerici (L)
  (cond
    ((numberp L) (list L))
    ((atom L) nil)
    (t (apply #'append (mapcar #'extrage-numerici L)))
  )
)

(defun valid (L)
  (cond
    ((null L) 0)
    ((= (mod (car L) 2) 0) 1)
    (t 0)
  )
)

(defun subl (L)
  (cond
    ((atom L) 0)
    (t (+ (valid (extrage-numerici L)) (apply #'+ (mapcar #'subl L))))
  )
)
