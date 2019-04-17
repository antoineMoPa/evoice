(defmacro replace-key (key action)
  `(add-hook
   'post-self-insert-hook
   (lambda ()
         (if (search-backward ,key nil t)
                 ((lambda ()
                        (delete-char (length ,key))
                        ,action
                        ))
           )
         )
   )
  )

(replace-key "line begin" (move-beginning-of-line 1))
(replace-key "delete line" (kill-line))
