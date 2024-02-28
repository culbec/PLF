; extrage_atomi (l: list)
; Extrage atomii din lista neliniara 'l', de pe orice nivel, in aceeasi ordine sau NIL daca nu primeste o lista.
; l: lista neliniara.

; MODEL MATEMATIC
;
; extrage_atomi(l1,...,ln) = {(l), daca l = atom}
;                            {U extrage_atomi(li), daca l = lista, unde i = 1..n}
;                            {nil, altfel}

(defun extrage_atomi(l)
  (cond
    ((atom l) (list l))
    ((listp l) (apply #'append (mapcar #'extrage_atomi l)))
    (t nil)
  )
)
