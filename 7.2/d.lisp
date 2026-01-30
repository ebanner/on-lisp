(defpackage :my-playground
  (:use :cl))

(in-package :my-playground)

(defmacro our-when (test &body body)
  `(if ,test
       (progn
         ,@body)))

(defun func (a &rest b)
  (print b))

(func 1 2)

(our-when t "Hi!")

(macroexpand '(our-when t "Hi!"))
