(defpackage :on-lisp
  (:use :cl))

(in-package :on-lisp)

(member 3 '(1 2 3 4 5))

(member 3 '(1 2 3 4 5) :test #'eq)

(defmacro memq (obj list)
  `(member ,obj ,list :test #'eq))

(macroexpand '(memq 3 '(1 2 3 4 5)))

(defmacro while (pred &body body)
  `(if ,pred
       (progn
         ,@body)))

(macroexpand
 '(while hungry
   (star-intently)
   (meow)
   (rub-against-legs)))
