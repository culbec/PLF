; Prelucreaza arborele n-ar.
(defun replace_on_odd_level_wrap (Arb E)
    (cond
        ((null Arb) nil)
        ((atom Arb) nil)
        ; 'list (car Arb)' pentru a putea face append cu subarborii prelucrati.
        (t (append (list (car Arb)) (apply #'append (mapcar #'(lambda (x) (replace_on_odd_level x E 1)) (cdr Arb)))))
    )
)

; Returneaza nodul de introdus in arbore in functie de nivel.
(defun is_on_odd_level (H E CurrLevel)
    (cond
        ((= (mod CurrLevel 2) 1) E)
        (t H)
    )
)

; Prelucreaza un subarbore din arborele n-ar.
(defun replace_on_odd_level (SubArb E CurrLevel)
    (cond
        ((null SubArb) nil)
        (
            t
            ; 'list' pentru a putea face append in wrap si pentru a pastra structura de arbore n-ar.
            (list (append (list (is_on_odd_level (car SubArb) E CurrLevel))
                          ; Prelucram si restul subarborilor din subarborele dat.
                          (apply #'append (mapcar #'(lambda (x) (replace_on_odd_level x E (+ 1 CurrLevel))) (cdr SubArb)))
                  )
            )
        )
    )
)
