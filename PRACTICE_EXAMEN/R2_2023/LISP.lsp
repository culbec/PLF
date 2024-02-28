(defun F (L)
    (cond
        ((null L) 0)
        ((> (F (car L) 2) (+ (car L) (cdr L))))
        (T (F (car L)))
    )
)

(defun FM (L)
    (cond
        ((null L) 0)
        (t (funcall #'(lambda (x) 
                        (cond 
                            ((null L) 0)
                            (t 
                                (cond
                                  ((> x 2) (+ (car L) (F (cdr L))))
                                  (t x)
                                )
                            )
                        )
                      )
            (F (car L))
          )
        )
    )
)

; replace_on_level_k (L: list K: int)
; Inlocuieste atomii de pe nivelul K din lista neliniara L cu 0. Nivelul superficial este 1.
; L: lista neliniara.
; K: nivelul din lista neliniara L in care atomii sunt inlocuiti cu 0.
; Return: lista neliniara L in care toti atomii de pe nivelul K sunt inlocuiti cu 0.

(defun replace_on_level_k (L K)
    (cond
        ((null L) nil)
        ((atom L) nil)
        (t (apply #'append(mapcar #'(lambda (x) (replace_on_elem x K 1)) L)))
    )
)

; replace_on_elem (Elem: element K: int CurrLevel: int)
; Elem: element pe care se efectueaza prelucrarea.
; K: nivelul de pe care toti atomii vor fi inlocuiti cu 0.
; CurrLevel: nivelul curent.

(defun replace_on_elem (Elem K CurrLevel)
    (cond
        ((= CurrLevel K) (cond ((atom Elem) (list 0)) (t (list Elem))))
        ((> CurrLevel K) (list Elem))
        (
            t
            (cond
                ((atom Elem) (list Elem))
                (t (list (apply #'append (mapcar #'(lambda (x) (replace_on_elem x K (+ 1 CurrLevel))) Elem))))
            )
        )
    )
)
