;; default load path
;;(defvar emacs-d (concat (getenv "HOME") "/.emacs.d/"))
 
;;(setq load-path (cons “~/.emacs.d/” load-path))
;;(add-to-list ‘load-path “~/.emacs.d/site-lisp”)
 
;; color theme select
;(require 'cc-mode)
;(require 'color-theme)
;(require 'menu-tree)


(add-to-list 'load-path "/Users/takeshishimada/ng/home/common/twittering-mode")
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(add-hook 'html-helper-mode "html-helper-mode" "Yay HTML" t)
 
;; riece
;; (autoload 'riece "riece" "Start Riece" t)
 
;; python-mode.el
;; (add-to-list 'load-path "/Users/takeshishimada/.emacs.d/site-lisp/python-mode.el-6.1.3")
;; (setq py-install-directory "/Users/takeshishimada/.emacs.d/site-lisp/python-mode.el-6.1.3")
;; (require 'python-mode)
(setq py-shell-name "ipython")
 
 
;; c-mode style settings
(setq c-default-style "k&r")
(add-hook 'c-mode-command-hook
          '(lambda ()
             (progn
               (c-toggle-hungry-style 1)
               (setq c-basic-offset 4 indent-tabs-mode nil))))
 
(add-hook 'java-mode-command-hook
          '(lambda ()
             (progn
               (c-toggle-hungry-style 1)
               (setq c-basic-offset 4 indent-tabs-mode nil))))
 
(add-hook 'java-mode-hook
          (lambda ()
            (message "java-mode-hook!!")
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 4)))
 
(add-hook 'javascript-mode-hook
          (lambda ()
            (message "javascript-mode-hook!!")
            (setq indent-tabs-mode nil)
            (setq tab-width 2)
            (setq c-basic-offset 2)))
 
(setq auto-mode-alist
      (append
       '(("\\.hpp$" . c++-mode)
         ("\\.h$" . c++-mode)
         ("\\.ts$" . javascript-mode)
         ) auto-mode-alist))
 
;; settings
(setq frame-title-format "%f - sakura 1.5.5.0")
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(fringe-mode 0 nil (fringe))
 '(line-number-mode t)
 '(menu-bar-mode nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(scroll-bar-mode nil)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
 
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-midnight)
     ))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#ffffff" :background "#000000" :box (:line-width 1 :color "#000000" :style nil)))))
 '(mode-line-inactive ((t (:foreground "#ffffff" :background "#000000" :box (:line-width 1 :color "#000000" :style nil)))))
 '(rst-level-1-face ((t (:background "black"))) t)
 '(rst-level-2-face ((t (:background "black"))) t)
 '(rst-level-3-face ((t (:background "black"))) t)
 '(rst-level-4-face ((t (:background "black"))) t)
 '(rst-level-5-face ((t (:background "black"))) t)
 '(rst-level-6-face ((t (:background "black"))) t))
 
;;(set-face-foreground 'minibuffer-prompt "#111111")
(set-face-background 'rst-level-1-face "black")
(set-face-background 'rst-level-2-face "black")
(set-face-background 'rst-level-3-face "black")
(set-face-background 'rst-level-4-face "black")
(set-face-background 'rst-level-5-face "black")
(set-face-background 'rst-level-6-face "black")
 
 
(require 'server)
;;(unless (server-running-p) (server-start)) ;; because macosx error
(setq server-visit-hook
      '(lambda ()
         (raise-frame (selected-frame))
         (x-forcus-frame (selected-frame))))
 
(setq inhibit-startup-message t)
(global-set-key "\C-h" 'delete-backword-char)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key (kbd "C-x C-g") 'goto-line)
 
(define-key global-map [f1] 'start-kbd-macro)
(define-key global-map [f2] 'end-kbd-macro)
(define-key global-map [f3] 'call-last-kbd-macro)
(fset 'tab-region [tab ?\C-n])
 
 
;; Emacs起動時にrst.elを読み込み
(require 'rst)
;; 拡張子の*.rst, *.restのファイルをrst-modeで開く
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))
:;; 背景が黒い場合はこうしないと見出しが見づらい
(setq frame-background-mode 'dark)
;; 全部スペースでインデントしましょう
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))
 
;; macos x
(setq default-input-method "MacOSX")
 
;; Google日本語入力
;; (mac-set-input-method-parameter "com.goolge.inputmethod.Japanese.base" `title "あ")
 
 
;;; キーバインド
;(define-key global-map "\C-h" 'delete-backward-char) ; 削除
;(define-key global-map "\M-?" 'help-for-help)        ; ヘルプ
;(define-key global-map "\C-z" 'undo)                 ; undo
;(define-key global-map "\C-ci" 'indent-region)       ; インデント
;(define-key global-map "\C-c\C-i" 'dabbrev-expand)   ; 補完
;(define-key global-map "\C-c;" 'comment-region)      ; コメントアウト
;(define-key global-map "\C-c:" 'uncomment-region)    ; コメント解除
;(define-key global-map "\C-o" 'toggle-input-method)  ; 日本語入力切替
;(define-key global-map "\C-\\" nil) ; \C-\の日本語入力の設定を無効にする
;(define-key global-map "\C-c " 'other-frame)         ; フレーム移動
 
(put 'downcase-region 'disabled nil)
 
 
(setq x-select-enable-clipboard t)
 
;; for twitter
(require 'twittering-mode)
(setq twittering-account-authorization 'authorized)
(setq twittering-oauth-access-token-alist
      '(("oauth_token" . "")
        ("oauth_token_secret" . "")
        ("user_id" . "")
        ("screen_name" . "")))
 
(setq twittering-tinyurl-service 'migre.me) ;; for mig.re
 
 
 
;; clipboard
;(add-to-list 'load-path (concat (getenv "CLIPSS_PATH") "/emacs"))
;(require 'clipss)
;(setq clipss-path (getenv "CLIPSS_PATH") )
;(clipss-init)
 
 
;; 不要な空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
 
 
;; sybows
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(global-font-lock-mode 1)
; tab
(setq-default tab-width 4
              indent-tabs-mode nil)
 
; daemon
;(server-start)
 
;; auto-install
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
;; (require 'auto-install)
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup)
 
 
;; mew
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
 
;; Optional setup (Read Mail menu):
(setq read-mail-command 'mew)
 
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))
 
;; package
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
 
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
 
;; 初期化
(package-initialize)
 
 
;; ** for python **
(add-hook 'python-mode-hook
          (lambda ()
            (c-set-offset 'statement-cont '++)
            (c-set-offset 'arglist-intro '+)
            (c-set-offset 'arglist-close 0)
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
 
(add-hook 'python-mode-hook '(lambda ()
     (define-key python-mode-map "\C-m" 'newline-and-indent)))
 
;; flake8
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
;(setq flymake-python-pyflakes-extra-arguments '("--ignore=W806"))
;; (custom-set-variables
;;  '(flymake-python-pyflakes-extra-arguments (quote ("--max-line-length=120" "--ignore=E128"))))
 
 
 
;; flymake
;; setting for flymake
(require 'flymake)
 
(global-set-key (kbd "M-e") 'flymake-goto-next-error)
(global-set-key (kbd "M-E") 'flymake-goto-prev-error)
 
;; Show error message under current line
(require 'popup)
(defun flymake-display-err-menu-for-current-line ()
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no))))
    (when line-err-info-list
      (let* ((count (length line-err-info-list))
             (menu-item-text nil))
        (while (> count 0)
          (setq menu-item-text (flymake-ler-text (nth (1- count) line-err-info-list)))
          (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
                 (line (flymake-ler-line (nth (1- count) line-err-info-list))))
            (if file
                (setq menu-item-text (concat menu-item-text " - " file "(" (format "%d" line) ")"))))
          (setq count (1- count))
          (if (> count 0) (setq menu-item-text (concat menu-item-text "\n")))
          )
        (popup-tip menu-item-text)))))
 
;; If you don't set :height, :bold face parameter of 'pop-tip-face,
;; then seting those default values
(if (eq 'unspecified (face-attribute 'popup-tip-face :height))
    (set-face-attribute 'popup-tip-face nil :height 1.0))
(if (eq 'unspecified (face-attribute 'popup-tip-face :weight))
    (set-face-attribute 'popup-tip-face nil :weight 'normal))
 
(defun my/display-error-message ()
  (let ((orig-face (face-attr-construct 'popup-tip-face)))
    (set-face-attribute 'popup-tip-face nil
                        :height 1.5 :foreground "firebrick"
                        :background "LightGoldenrod1" :bold t)
    (unwind-protect
        (flymake-display-err-menu-for-current-line)
      (while orig-face
        (set-face-attribute 'popup-tip-face nil (car orig-face) (cadr orig-face))
        (setq orig-face (cddr orig-face))))))
 
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message)
  (my/display-error-message))
(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message)
  (my/display-error-message))
 
(ad-activate 'flymake-goto-prev-error 'flymake-goto-prev-error-display-message)
(ad-activate 'flymake-goto-next-error 'flymake-goto-next-error-display-message)
 
 
 
;; no backup file
(setq make-backup-files nil)
(setq version-control 'never)
 
 
 
;; helm
;; (when (require 'helm-config nil t)
;;   (helm-mode 1)
 
;;   (define-key global-map (kbd "M-x")     'helm-M-x)
;;   (define-key global-map (kbd "C-x C-f") 'helm-find-files)
;;   (define-key global-map (kbd "C-x C-r") 'helm-recentf)
;;   (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
;;   (define-key global-map (kbd "C-c i")   'helm-imenu)
;;   (define-key global-map (kbd "C-x b")   'helm-buffers-list)
 
;;   (define-key helm-map (kbd "C-h") 'delete-backward-char)
;;   (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
;;   (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;;   (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
 
;;   ;; Disable helm in some functions
;;   (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
 
;;   ;; Emulate `kill-line' in helm minibuffer
;;   (setq helm-delete-minibuffer-contents-from-point t)
;;   (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
;;     "Emulate `kill-line' in helm minibuffer"
;;     (kill-new (buffer-substring (point) (field-end))))
 
;;   (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
;;     "Execute command only if CANDIDATE exists"
;;     (when (file-exists-p candidate)
;;       ad-do-it))
 
;;   (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
;;     "Transform the pattern to reflect my intention"
;;     (let* ((pattern (ad-get-arg 0))
;;            (input-pattern (file-name-nondirectory pattern))
;;            (dirname (file-name-directory pattern)))
;;       (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
;;       (setq ad-return-value
;;             (concat dirname
;;                     (if (string-match "^\\^" input-pattern)
;;                         ;; '^' is a pattern for basename
;;                         ;; and not required because the directory name is prepended
;;                         (substring input-pattern 1)
;;                       (concat ".*" input-pattern)))))))
