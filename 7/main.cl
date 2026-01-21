(defmacro nil! (var)
  (list 'setq var nil))

(defmacro nil-backtick! (var)
  `(setq ,var nil))

(macroexpand '(nil! x))

(macroexpand-1 '(nil! x))

