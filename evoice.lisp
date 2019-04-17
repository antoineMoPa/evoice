(defmacro replace-key (key action)
  `(add-hook
   'post-self-insert-hook
   (lambda ()
         (if (search-backward ,key (line-beginning-position) t)
                 ((lambda ()
                        (delete-char (length ,key))
                        (call-interactively (global-key-binding ,action))
                        ))
           )
         )
   )
  )

(replace-key " aa" "\C-a")
(replace-key " kk" "\C-k")
