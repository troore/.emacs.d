;;-----------------Basic Settings----------------;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; (set-default-font "Monospace 18")
(set-default-font "Courier 18")

;; Set default window (emacs frame) size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 82) ; chars
              (height . 60) ; lines
              (background-color . "honeydew")
              (left . 50)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 82)
              (height . 60)
              (background-color . "honeydew")
              (left . 50)
              (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;; mode line configuration{
;Enable the display of the current time
(display-time-mode t)
;Enable or disable the display of the current line number
(line-number-mode t)
;(setq linum-format (quote "%1d "))
;;Right-aligned
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat "%" (number-to-string w) "d ")))
    ad-do-it))
;Enable or disable the display of the current column number
(column-number-mode t)
;;}

;;remove tool bar or menu bar in graphic emacs{
(tool-bar-mode -1)
;(menu-bar-mode -1)

;;display line number
(global-linum-mode t)

;;set where the scroll bars should be {
;(set-scroll-bar-mode 'right) ; replace "'right" with "'left" to place it to the left
;;}

;remove Emacs welcome window on start
(setq inhibit-startup-message t)


;;disable #F# files
(setq auto-save-default nil)
;;disable temporary files
(setq-default make-backup-files nil)

;; tab width
(setq default-tab-width 2)

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

;;-----------------MELPA----------------;;
;(browse-url-emacs "http://melpa.org/packages/archive-contents" t)
(require 'package)
;(add-to-list 'package-archives
;             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;(require 'ycmd)
;(add-hook 'c++-mode-hook 'ycmd-mode)
;(set-variable 'ycmd-server-command '("/home/xuechao/tools/anaconda3/bin/python" "/home/xuechao/download/ycmd/ycmd"))

