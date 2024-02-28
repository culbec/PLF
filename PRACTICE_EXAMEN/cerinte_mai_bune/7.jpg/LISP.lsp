(defun sub (L)
  (cond
    ((and (numberp L) (= (mod L 2) 0)) (+ 1 L))
    ((listp L) (mapcar #'sub L))
    (t L)
  )
)

(defun extract-numbers (L K)
  (cond
    ((and (numberp L) (= (mod K 2) 1)) (list L))
    ((atom L) nil)
    (t (apply #'append (mapcar #'(lambda (x) (extract-numbers x (+ 1 K))) L)))
  )
)

(defun valid (L)
  (cond
    ((null L) 0)
    ((= (mod (apply #'max L) 2) 0) 1)
    (t 0)
  )
)

(defun subL (L)
  (cond
    ((atom L) 0)
    (t (+ (valid (extract-numbers L 0)) (apply #'+ (mapcar #'subL L))))
  )
)
