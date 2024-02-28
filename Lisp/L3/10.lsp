(defun noduriKAux (Arb K CurrLevel)
  (cond
    ((< CurrLevel K)
     (cond
      ((listp Arb) (apply #'+ (mapcar #'(lambda (y) (noduriKAux y K (+ 1 CurrLevel))) Arb)))
      (t 0)
     )
    )
    ((= CurrLevel K)
     (cond
      ((atom Arb) 1)
      (t 0)
     )
    )
    (t 0)
  )
)

(defun noduriK (Arb K)
  (cond
    ((listp Arb) (apply #'+ (mapcar #'(lambda (x) (noduriKAux x K 0)) Arb)))
    (t nil)
  )
)
