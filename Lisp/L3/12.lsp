; replace_e (e: element old_node: element new_node: element)
; Prelucreaza 'e', inlocuind old_node cu new_node in functie de natura lui e (nod in arbore sau subarbore).
; e: element de prelucrat.
; old_node: nodul de inlocuit;
; new_node: nodul cu care se inlocuieste;

; MODEL MATEMATIC
;                                    {(new_node), daca e - atom si e = old_node}
;                                    {(e), daca e - atom si e != old_node}
; replace_e(e, old_node, new_node) = { U (replace_e(ei, old_node, new_node)), daca e = lista nevida, unde i = 1..n}
;                                    { nil, altfel}

(defun replace_e (e old_node new_node)
  (cond
    ((and (atom e) (eq e old_node)) new_node)
    ((and (atom e) (not (eq e old_node))) e)
    ; returnez o lista din rezultatul prelucrarii lui e pentru a pastra aspectul de lista al unui subarbore.
    ((listp e) (mapcar #'(lambda (x) (replace_e x old_node new_node)) e))
    (t nil)
  )
)

; replace_node(arb: list old_node: atom new_node: atom)
; Inlocuieste nodul cu valoarea old_node cu nodul cu valoarea new_node in arb.
; arb - arbore n-ar reprezentat sub forma (rad lista_subarb_1 ... lista_subarb_n)
; old_node - nod din arb care trebuie inlocuit
; new_node - nod cu care se inlocuieste old_node

; MODEL MATEMATIC
;                                                     {U replace_e(arbi, old_node, new_node), daca arb = lista nevida, unde i = 1..n}
; replace_node(arb1,..., arbn, old_node, new_node) =  {nil, altfel}

(defun replace_node (arb old_node new_node)
  (cond
    ((listp arb)
     (mapcar #'(lambda(x) (replace_e x old_node new_node)) arb)
    )
    (t nil) ; daca nu am primit o lista (... arbore) atunci iesim cu NIL.
  ) 
)
