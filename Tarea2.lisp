;Tarea 1: <Problema del Arriero>
;Nombre del Alumno: <Moreno Huallanca, Mario Gustavo>
;Codigo: <13200030>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;compilar con (principal)
;;;;;
;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;variables globales
(setq eIni '(1 1 1 1))
(setq eActual eini)
(setq eFin '(-1 -1 -1 -1))

;movimientos
;M1 Tarriero: solo se mueve el arriero
(defun Tarriero (estado) 
  (list  (* -1 (car estado)) (cadr estado) (caddr estado) (nth 3 estado))
)
;M2 Tpuma: el arriero transporta al puma
(defun Tpuma (estado) 
  (append (list (* -1 (car estado)) (* -1 (cadr estado))) (nthcdr 2 estado))
)
;M3 Tcabra: el arriero transporta a la cabra
(defun Tcabra (estado) 
  (append (list (* -1 (car estado)) (cadr estado) (* -1 (caddr estado))) (last estado))
)
;M4 Tlechuga: el arriero transporta a la lechuga
(defun Tlechuga (estado) 
  (list (* -1 (car estado)) (cadr estado) (caddr estado) (* -1 (nth 3 estado)))
)
;Reglas
;R1 Tasesina: el puma no puede quedarse solo con la cabra y la cabra no puede quedarse sola con la lechuga
(defun Tasesina(estado)
	(setq suma ( + (cadr estado) (caddr estado) (nth 3 estado)))
)
;R2 transporte: El arriero debe estar del mismo lado del objeto que va a transportar
(defun transporte(estado i)
	(if (= (car estado) (nth i estado))
		T
		NIL
	)
)
;Realiza el movimiento
(defun mover(estado i) 
		(case i
			(0 (Tarriero estado))
			(1 (Tpuma estado))
			(2 (Tcabra estado))
			(3 (Tlechuga estado))
		)	
)
;Actualiza el estado
(defun actualizarEstado(estado) 
	(setq eActual estado)
)
;compilar esto
(defun principal()
	(progn 
		(print "cual quieres mover? (0: arriero 1: puma 2: cabra 3: lechuga)")
		(setq indice (read))
		(if (transporte eActual indice)
			(setq e (mover eActual indice))
			(print "No puede moverse")
		)
		(actualizarEstado e)
	)
)
