;; size(X: list)
;; Calculeaza lungimea listei X
;; X - lista
(defun size (X)
	(cond
		((null X) 0)
		(t
			(+ 1 (size(cdr X)))
		)
	)
)

;; dotProduct(X: list, Y: list)
;; Calculeaza produsul scalar a doi vectori.
;; X - vector
;; Y - vector
(defun dotProduct(X Y)
	(cond
		((null X) 0)
		(t
			(+ (* (car X) (car Y)) (dotProduct (cdr X) (cdr Y)))
		)
	)
)

;; dotProductMain(X: list, Y: list)
;; Calculeaza produsul scalar al doi vectori sau NIL daca vectorii
;; nu au aceeasi dimensiune.
;; X - vector
;; Y - vector
(defun dotProductMain(X Y)
	(cond
		(
			(or (null X) (null Y))
			nil
		)
		((/= (size X) (size Y))
		  nil
		)
		(t
		 (dotProduct X Y)
		)
	)
)

;; maxNumeric(L: list, Max: int)
;; Returneaza maximul dintre atomii numerici de pe toate nivelele.
;; L - lista
;; Max - maximul de pe toate nivelele
(defun maxNumeric(L Max)
	(cond
		(
			(null L) Max
		)
		
		(
			(numberp(car L))
			; sau
			; (cond
			; 		(
			; 			(or (null Max) (< Max (car L)))
			; 			(maxNumeric (cdr L) (car L))
			; 		)
			; 		(
			; 			t
			; 			(maxNumeric (cdr L) Max)
			; 		)		
			; 	)
		 	(if (or (null Max) (< Max (car L)))
		 		(maxNumeric (cdr L) (car L))
				(maxNumeric (cdr L) Max)
			)
		)
		
		(
			(listp(car L))
			(maxNumeric (cdr L) (maxNumeric (car L) Max))
     	)
		
		(	
			t
			(maxNumeric (cdr L) Max)
		)
	)
)

;; maxNumericMain(L)
;; Calculeaza maximul numeric de pe toate nivelele ale lui L.
;; L - lista
(defun maxNumericMain(L)
	(cond
		((numberp L) L)
		((atom L) nil)
		(
			t
			(maxNumeric L nil)
		)
	)
)

;; inserarePozitie(E: element L: lista I: int Pos: int)
;; Insereaza E in L pe pozitia Pos
;; E - element de inserat
;; L - lista unde se insereaza E
;; I - index curent
;; Pos - pozitia pe care se va insera E in L
(defun inserarePozitie(E L I Pos)
  (cond
    (
		(= I Pos)
		; inseram elementul si continuam cu inserarea celor de dupa
		(cons E (inserarePozitie E L (+ 1 I) Pos))
	)
	(
		(null L) 
		'()
	)
    (
		t
		(cons (car L) (inserarePozitie E (cdr L) (+ 1 I) Pos))
	)
  )
)

;; inserareAll(E: element L: lista Pos: int N: int)
;; Insereaza elementul E pe toate pozitiile din L
;; E - element de inserat
;; L - lista unde se insereaza E
;; Pos - pozitia curenta pe care se va insera E in L
;; N - dimensiunea listei L
(defun inserareAll(E L Pos N)
  (cond
    (
		(> Pos (+ 1 N)) 
		'()
	)
    (
		t
		; construim lista formata prin inserarea lui E pe toate pozitiile din L 
		(cons (inserarePozitie E L 1 Pos) (inserareAll E L (+ 1 Pos) N))
	)
  )
)

;; inserare(E: element L: lista)
;; Insereaza elementul E pe toate pozitiile in toate listele din lista L
;; E - element de inserat
;; L - lista de liste
(defun inserare(E L)
  (cond
    (
		(null L) 
		'()
	)
    (
		t
		; inseram elementul printre toate permutarile determinate
		(append (inserareAll E (car L) 1 (size (car L))) (inserare E (cdr L)))
	)
  )
)

;; permutari(L: lista)
;; Determina toate permutarile listei L.
;; L - lista de numere
(defun permutari(L)
  (cond
	(
		(null L)
		 nil
	)
    (
		(null (cdr L)) 
		; lista formata doar din ultimul element
		(list (list (car L)))
	)
    (
		t
		; in oricare alt caz, inseram elementul curent intre permutarile celorlalte elemente
		; -> divide et impera	 
		(inserare (car L) (permutari (cdr L)))
	)
  )
)


;; evenSize(L: list Indicator: boolean)
;; Determina daca o lista are numar par de elemente pe primul nivel
;; fara sa numere elementele.
;; L - lista
;; Indicator - boolean ce ne indica paritatea numarului de elemente
;; Indicator va fi initial nil
(defun evenSize(L Indicator)
	(cond
		(
			(null L)
			(and Indicator t)
		)
		(
			t
			(evenSize (cdr L) (not Indicator))
		)
	)
)

;; evenSizeMain(L: list)
;; Determina daca L are un numar par de elemente pe primul nivel
;; sau returneaza -1 daca L nu este lista sau lista vida.
;; L - lista
(defun evenSizeMain(L)
	(cond
		(
			(null L)
			-1
		)
		(
			(listp L)
			(evenSize (cdr L) nil)
		)
		(
			t
			-1
		)
	)
)
