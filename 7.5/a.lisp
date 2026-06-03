(defpackage :on-lisp
  (:use :cl))

(in-package :on-lisp)


(defmacro our-expander (name) `(get ,name 'expander))


(defmacro our-defmacro (name parms &body body)
  (let ((expr (gensym)))
    `(progn
       (setf (our-expander ',name)
             #'(lambda (,expr)
                 (destructuring-bind ,parms (cdr ,expr)
                   ,@body)))
       ',name)))


(defun our-macroexpand-1 (expr)
  (let ((name (car expr)))
   (if (and (consp expr) (our-expander name))
       (funcall (our-expander name) expr)
       expr)))


;;;


(our-defmacro square (x)
  `(* ,x ,x))


(get 'square 'expander)


(our-macroexpand-1 '(square 5))


(funcall (get 'square 'expander) '(square 5))


(eval (funcall (get 'square 'expander) '(square 5)))
