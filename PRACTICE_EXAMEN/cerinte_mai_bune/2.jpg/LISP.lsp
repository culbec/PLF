(defun F(L)
  (cond
    ((NULL L) nil)
    ((LISTP L) (funcall #'(lambda(x) (append x (F (cdr L)) (car x))) (F (car L))))
    (t (list (car L)))
  )
)

(defun remove_e (L E)
  (car (remove_e_aux L E))
)

(defun remove_e_aux (L E)
  (cond
    ((and (atom L) (equal L E)) nil)
    ((and (atom L) (not (equal L E))) (list L))
    (t (list (apply #'append (mapcar #'(lambda (x) (remove_e_aux x E)) L))))
  )
)

(defun remove_e_1 (L E)
  (cond
    ((listp L) (mapcan #'(lambda (x) (remove_e_aux_1 x E)) L))
    (t nil)
  )
)

(defun remove_e_aux_1 (L E)
  (cond
    ((and (atom L) (not (equal L E))) (list L))
    ((and (atom L) (equal L E)) nil)
    (t (list (mapcan #'(lambda (x) (remove_e_aux_1 x E)) L)))
  )
)

(defun extrage_numerici (L)
    (cond
      ((numberp L) (list L))
      ((listp L) (apply #'append (mapcar #'extrage_numerici L)))
      (t nil)
    )
)

(defun valid (L)
  (cond
    ((listp L)
     (cond
        ((= (mod (apply #'+ L) 2) 1) 0)
        (t 1)
     )
    )
    (t 0)
  )
)

(defun sublista_nivel_impar_suma_para_aux (L K)
  (cond
    ((listp L) 
     (cond
      ((= (mod K 2) 1) 
       (+ (valid (extrage_numerici L)) 
          (+ (apply #'+ (mapcar #'(lambda (x) (sublista_nivel_impar_suma_para_aux x (+ 1 K))) L))
             (apply #'+ (mapcar #'valid (mapcar #'(lambda (x)
                                                    (cond
                                                      ((atom x) 0)
                                                      (t (extrage_numerici x))
                                                    )
                                                  ) 
                                         L
                                        )
                        )
             )
          )
       )
      )
      (t (apply #'+ (mapcar #'(lambda (x) (sublista_nivel_impar_suma_para_aux x (+ 1 K))) L)))
     )
    )
    (t 0)
  )
)

(defun sublista_nivel_impar_suma_para (L)
  (cond
    ((listp L) (+ (valid (extrage_numerici L)) (apply #'+ (mapcar #'(lambda (x) (sublista_nivel_impar_suma_para_aux x 1)) L))))
    (t nil)
  )
)
