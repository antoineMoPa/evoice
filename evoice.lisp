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

;; You can use replace-key to call a shortcut whenever you type something
;; or say something.
;; Since google voice can't send "CTRL", it can be useful to setup phrases like "line begin"
(replace-key "line begin" "\C-a")

;; Other shortcut ideas:
;; In termux, typing CTRL+a is slow, but typing " aa" is faster:
(replace-key " aa" "\C-a")
(replace-key " kk" "\C-k")



