(defun FCT(F L) ; evitare apel repetat al (FUNCALL F (CAR L)
  (cond
      ((NULL L) NIL)
      (t
        (funcall #'(lambda (x)
                      (cond
                          (x (cons x (FCT F (cdr L))))
                          (t nil)
                      )
                  )
          (funcall F (car l))
        )
       )
  )
)
