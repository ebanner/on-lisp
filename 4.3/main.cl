; Section 4.3

(defun search-b (lst b)
  (if (null lst)
      nil
      (if (= (car lst) b)
          t
          (search-b (cdr lst) b))))

(defun search-a (lst a b)
  (if (null lst)
      nil
      (if (= (car lst) a)
          (search-b (cdr lst) b)
          (search-a (cdr lst) a b))))

(defun search-a-b (lst a b)
  (search-a lst a b))

(search-a-b '(1 2 3) 3 1)

;;;

(defun search-a-b (lst a b)
  (labels ((search-a (lst)
             (if (null lst)
                 nil
                 (if (= (car lst) a)
                     (search-b (cdr lst) b)
                     (search-a (cdr lst) a b))))
           (search-b (lst)
             (if (null lst)
                 nil
                 (if (= (car lst) b)
                     t
                     (search-b (cdr lst) b)))))
    (search-a lst)))

(search-a-b '(1 2 3) 3 1)
