; Model matematic
;                           { fals, daca n < 2 }
; zig-zag-aux(l1...ln) =    { (l1 < l2) ^ (l2 > l3), daca n = 3 }
;                           { (l1 < l2) ^ (l2 > l3) & zig-zag-aux(l3...ln), altfel }

(defun zig-zag-aux (L)
    (cond
        ((or (null (cdr L)) (null (cddr L))) nil)
        ((null (cdddr L)) (and (< (car L) (cadr L)) (> (cadr L) (caddr L))))
        (t (and (< (car L) (cadr L)) (> (cadr L) (caddr L)) (zig-zag-aux (cddr L))))
    )
)

; Model matematic
;                       { 0, daca n = 0 }
; lungime(l1...ln) =    { 1 + lungime(l2...ln), altfel }

(defun lungime (L)
    (cond
        ((null L) 0)
        (t (+ 1 (lungime (cdr L))))
    )
)

; Model matematic
;
; valid(l1...ln) = zig-zag-aux(l1...ln) ^ lungime(l1...ln) % 2 = 1

(defun valid(L)
    (and (zig-zag-aux L) (= (mod (lungime L) 2) 1))
)

; Model matematic:
;                               { (l), daca l = numar }
; extrage-numerici(l1 ... ln) = { multimea vida, daca l = atom }
;                               { U extrage-numerici(li), altfel, unde i = 1..n }

(defun extrage-numerici (L)
    (cond
        ((numberp L) (list L))
        ((atom L) nil)
        (t (apply #'append (mapcar #'extrage-numerici L)))
    )
)

; Model matematic
;                       { valid(extrage-numerici(l1..ln)), daca l este lista }
; zig-zag(l1..ln) =     { fals, altfel }

(defun zig-zag (L)
    (cond
        ((listp L) (valid (extrage-numerici L)))
        (t nil)
    )
)