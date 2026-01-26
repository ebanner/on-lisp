(defpackage :my-playground
  (:use :cl))

(in-package :my-playground)

(defvar result)
(defvar sign)

(defmacro nif (expr pos zero neg)
  (list
   'progn
   (list 'setf 'sign (list 'signum expr))
   (list 'setf 'result '(truncate 'sign))
   (list 'case 'result
         (list 1 pos)
         (list 0 zero)
         (list -1 neg))))

(macroexpand '(nif 0 'p 'z 'n))

(nif 0 'p 'z 'n)
