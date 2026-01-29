(defpackage :my-playground
  (:use :cl))

(in-package :my-playground)

(setq b '(1 2 3))

`(a b c)

`(a ,b c)

`(a ,@b c)
