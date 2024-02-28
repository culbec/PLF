(defun Fct (F L)
    (cond
        ((null L) nil)
        (
            t
            (funcall #'(lambda (x) ()
                          (cond
                              (x (cons x (Fct F (cdr L))))
                              (t nil)
                          )
                       )
              (funcall F (car L))
            )
        )
    )
)

; replace_on_level_k_wrap (Arb: list E: element)
; Inlocuieste elementele de pe nivele impare cu valoare lui E. Radacina se afla pe nivelul 0.
; Arb: Arbore n-ar.
; E: elementul cu care se inlocuiesc nodurile de pe niveluri impare din arborele n-ar.
(defun replace_on_level_k_wrap (Arb E)
    (cond ; daca Arb este lista vida sau atom => NIL (decizie de proiectare)
        ((null Arb) nil)
        ((atom Arb) nil)
        (
            t ; altfel, concatenam toate rezultatele rezultate din prelucrarea fiecarui element din arborele n-ar
            (apply #'append (mapcar #'(lambda (x) (replace_on_level_k x E 0 )) Arb))
        )
    )
)

; replace_on_level_k (SubArb: list E: element CurrLevel: integer)
; Inlocuieste nodurile de pe nivele impare de pe subarbore cu elementul E.
; SubArb: subarborele din arborele n-ar.
; E: element cu care se inlocuiesc nodurile de pe nivele impare.
; CurrLevel: nivelul curent.
(defun replace_on_level_k (SubArb E CurrLevel)
    (cond
        (
            (atom SubArb) ; daca SubArb este atom => suntem pe radacina
            (cond ; returnam lista formata din E sau radacina lui SubArb in functie de nivel
                ((= (mod CurrLevel 2) 1) (list E))
                (t (list SubArb))
            )
        )
        (
            t ; daca SubArb este la randul lui tot un subarbore,
              ; returnam subarborele in care se inlocuiesc pe nodurile de pe nivele impare cu valoarea E
            (list (apply #'append (mapcar #'(lambda (x) (replace_on_level_k x E (+ 1 CurrLevel))) SubArb)))
        )
    )
)
