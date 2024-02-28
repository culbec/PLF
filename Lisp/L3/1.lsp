; adancime(l: list)
; Determina adancimea listei l.
; l: lista neliniara.

; MODEL MATEMATIC;
;
; adancime(l1,...,ln) = {-1, daca n = 0 sau l nu este lista}
;                       {1 + max(U adancime(li)), altfel, unde i = 1..n}

(defun adancime (l)
  (cond
    ((listp l) (+ 1 (apply #'max (mapcar #'adancime l))))
    (t -1) ; am considerat ca nivelul superficial este 0.
  )
)
