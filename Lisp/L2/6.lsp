; inordine (Arb: list)
; Arb - arbore binar reprezentat sub forma (rad nrSubArbRad nod1 nrSubArbNod1 ...)
; Exemplu: (A 2 B 0 C 2 D 0 E 0) -> (B A D C E) (DEZAVANTAJ: nu avem cum sa ne dam seama daca e arb st sau drept)

(defun inordine (Arb)
    (cond
        (
            (atom Arb) ; cazul in care nu se primeste o lista
            NIL
        )
        (
            (= 0 (cadr Arb)) ; cazul in care radacina nu are alti subarbori
            (list (car Arb))
        )
        (
            t
            ;(funcall #'(lambda (Arbori)
            ;           (append (inordine (car Arbori)) (list (car Arb)) (inordine (cadr Arbori)))
            ;         )
            ;        (extrage_arbori Arb) 
            ;)
            (append (inordine (stang Arb)) (list (car Arb)) (inordine (drept Arb)))
            ; parcurgem inordine stang (+) radacina (+) extragem drept
        )
    )
)

; extrage(Arb: list ArbSt: list nv: int nm: int)
; Extrage subarborii stang si drept din Arb
; Arb -> arbore binar
; ArbSt -> subarborele drept
; nv -> nr. noduri din subarb stang
; nm -> nr. muchii din subarb stang

(defun extrage(Arb ArbSt nv nm)
  (cond
    (
        (null Arb)
        (cons nil (list Arb)) ; returnam (() Arb) daca arborele este vid
    )
    (
        (= nv (+ 1 nm))
        (cons ArbSt (list Arb)) ; returnam (ArbSt Arb) daca ArbSt urmeaza sa nu mai fie arbore
    )
    (
        t
        (extrage (cddr Arb)
                 (append ArbSt (cons (car Arb) (list (cadr Arb))))
                 (+ 1 nv)
                 (+ (cadr Arb) nm)
        )
        ; extragem subarborii in continuare daca s-a pastrat conditia de arbore
    )
  )
)

; extrage(Arb: list)
; Extrage subarborii stang si drept din Arb
; Arb -> arbore binar

(defun extrage_arbori(Arb)
  (extrage (cddr Arb) () 0 0)
)

; stang(Arb: list)
; Arb -> arborele din care extragem subarborele stang

(defun stang(Arb)
    (parcurg_stang (cddr Arb) 0 0)
)

; parcurg_stang(Arb: list nv: int nm: int)
; Arb -> arborele din care extragem subarborele stang
; nv -> numarul de varfuri din subarbore
; nm -> numarul de muchii din subarbore

(defun parcurg_stang(Arb nv nm)
    (cond
        (
            (null Arb)
            nil
        )
        (
            (= nv (+ 1 nm)) ; nu mai e arbore -> am gasit subarb stang
            nil
        )
        (
            t
            (cons (car Arb) (cons (cadr Arb) (parcurg_stang (cddr Arb) (+ 1 nv) (+ (cadr Arb) nm))))
            ; lista din radacina (+) nrSubArb (+) restul parcurgerii
        )
    )
)

; drept(Arb: list)
; Arb -> arborele din care extragem suboarborele drept

(defun drept(Arb)
    (extrag_drept (cddr Arb) 0 0)
)   

; extrag_drept(Arb: list nv: int nm: int)
; Arb -> arborele din care extragem subarborele drept
; nv -> numarul de varfuri
; nm -> numarul de muchii

(defun extrag_drept (Arb nv nm)
    (cond
        (
            (null Arb)
            nil

        )
        (
            (= nv (+ 1 nm)) ; nu mai este arbore -> returnam restul arborelui = subarb drept
            Arb
        )
        (
          t
          (extrag_drept (cddr Arb) (+ 1 nv) (+ (cadr Arb) nm))
          ; trecem peste perechea (nod nrSubArb) si actualizam nr. noduri si nr. muchii
        )
    )
)
