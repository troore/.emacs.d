;;-----------------Basic Settings----------------;;

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; mode line configuration{
;Enable the display of the current time
(display-time-mode t)
;Enable or disable the display of the current line number
(line-number-mode t)
(setq linum-format "%2d ")
;Enable or disable the display of the current column number
(column-number-mode t)
;;}

;;remove tool bar or menu bar in graphic emacs{
(tool-bar-mode -1)
;(menu-bar-mode -1)

;;display line number
(global-linum-mode t)

;;set where the scroll bars should be {
(set-scroll-bar-mode 'right) ; replace "'right" with "'left" to place it to the left
;;}

;remove Emacs welcome window on start
(setq inhibit-startup-message t)


;;disable #F# files
(setq auto-save-default nil)
;;disable temporary files
(setq-default make-backup-files nil)



;; tab width
(setq default-tab-width 4)

;; Aspell {
;; M-x flyspell-mode
(setq-default ispell-program-name "aspell") 
;; }

;; makefile {
(add-hook 'makefile-mode-hook
	  (lambda ()
	    (whitespace-cleanup-mode 0)
	    (setq tab-width 4)))
;;}

;; google-c-style
(add-to-list 'load-path
             "~/.emacs.d/lisp/google")
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


;; cc-mode {
;(add-hook 'c-mode-hook 'set-newline-and-indent)
(add-hook 'c-mode-hook '(lambda ()
			  (local-set-key (kbd "RET") 'newline-and-indent)
			  (c-set-style "stroustrup")
			  ))
(add-hook 'c++-mode-hook '(lambda ()
			    (local-set-key (kbd "RET") 'newline-and-indent)
			    (c-set-style "stroustrup")
			    ))
; default c-basic-offset may be 2 or 5
;(setq c-basic-offset 4)
;(c-set-offset 'substatement-open 0)
;; } End-of-cc-mode

