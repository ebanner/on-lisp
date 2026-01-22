(defpackage :my-playground
  (:use :cl))

(in-package :my-playground)

(defvar result)
(defvar sign)

(defmacro nif (expr pos zero neg)
  `(progn
     (setf sign (signum ,expr))
     (setf result (truncate sign))
     (case result
       (1 ,pos)
       (0 ,zero)
       (-1 ,neg))))

(nif 0 'p 'z 'n)
