;;-----------------Basic Settings----------------;;

(add-to-list 'load-path "~/.emacs.d/lisp/")
;(let ((default-directory "~/.emacs.d/lisp/"))
;  (normal-top-level-add-subdirs-to-load-path))

;; mode line configuration{
;Enable the display of the current time
(display-time-mode t)
;Enable or disable the display of the current line number
(line-number-mode t)
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

;;modify default emacs font{
;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")
(set-default-font "DejaVu Sans Mono-14")
;;}

;;不生成#F#文件
(setq auto-save-default nil)
;;不生成临时文件
(setq-default make-backup-files nil)


;;indentation {
(defun set-newline-and-indent()
 (local-set-key (kbd "RET") 'newline-and-indent))
;;}

;; 统一设置tab默认长度
(setq default-tab-width 4)

;;---------------------Advanced Settings-----------------;;

;;color theme{
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-xp)
;;}

;;html
(add-hook 'html-mode-hook 'set-newline-and-indent)
;;}


;;verilog {
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))
(add-hook 'verilog-mode-hook '(lambda ()
    (add-hook 'local-write-file-hooks (lambda()
       (untabify (point-min) (point-max))))))
;;}


;; Markdown {
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'markdown-mode-hook
        (lambda ()
          (when buffer-file-name
            (add-hook 'after-save-hook
                      'check-parens
                      nil t))))
; warning, may yield wrong results in edge-cases like single double-quotes in code block.
; Use only if your files usually are balanced w/r/t double-quotes
; <http://stackoverflow.com/questions/9527593/customizing-check-parens-to-check-double-quotes>
(add-hook 'markdown-mode-hook (lambda () (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)))
;;}

;; matlab mode {
; Only use matlab.el for editing code, do not try other tools currently.
(add-to-list 'load-path "/home/troore/.emacs.d/lisp/matlab-emacs/matlab-emacs")
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")
;;}

;; Aspell {
;; M-x flyspell-mode
 (setq-default ispell-program-name "aspell") 
;; }

;; cedet {
;;
(load-file "~/.emacs.d/lisp/cedet/cedet-devel-load.el")

;; semantic
;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; Enable Semantic
(semantic-mode 1)

;; Remove 'system from the throttle to speed up parsing
(setq-mode-local c-mode
				 semanticdb-find-default-throttle
				 '(project unloaded recursive))

; 配置semantic的检索范围
(setq semanticdb-project-roots
	  (list
		(expand-file-name "./")))

; 为智能补全类或结构体成员绑定快捷键
;(global-set-key "C-c C-v" (quote semantic-ia-complete-menu))

;(setq semanticdb-project-roots
;	  (list "~/Projects/gpu-engineering/GPGPU-Sim/gpgpu-sim/v3.x/src"))

;; Enable EDE (Project Management) features
;(global-ede-mode 1)

;;;} End-of-cedet

;; ibus {
(add-to-list 'load-path "~/.emacs.d/lisp/ibus-el-0.3.2")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(global-set-key (kbd "C-=") 'ibus-toggle) ;;这里即是绑定设置的C+=快捷键到ibus中
;;}

;; python {
(add-to-list 'load-path "~/.emacs.d/lisp/python-mode-6.1.3")
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;;}

;; cscope {
(add-to-list 'load-path "~/.emacs.d/lisp/xcscope")
(require 'xcscope)
(cscope-setup)
; invoke xcscope for c/c++ files only
(add-hook 'c-mode-common-hook
	  '(lambda ()
	    (require 'xcscope)))
;;}

;; ecb {
(require 'semantic/analyze)
(provide 'semantic-analyze)
(provide 'semantic-ctxt)
(provide 'semanticdb)
(provide 'semanticdb-find)
(provide 'semanticdb-mode)
(provide 'semantic-load)
(add-to-list 'load-path "~/.emacs.d/lisp/ecb-2.40")
(require 'ecb)
;(require 'ecb-autoloads)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ede-project-directories (quote ("/home/troore/Projects/gpu-engineering/GPGPU-Sim/gpgpu-sim/v3.x/src"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;;}

;; makefile {
(add-hook 'makefile-mode-hook
		  (lambda ()
			(whitespace-cleanup-mode 0)
			(setq tab-width 8)))
;;}

;; cc-mode {
(add-hook 'c-mode-hook 'set-newline-and-indent)
(add-hook 'c++-mode-hook '(lambda ()
						 (local-set-key (kbd "RET") 'newline-and-indent)
						 (c-set-style "stroustrup")))
(setq c-basic-offset 4)
(c-set-offset 'substatement-open 0)
;; } End-of-cc-mode
