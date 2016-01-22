;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;(load-theme 'solarized-dark t)
;;(load-theme 'monokai t)
;;(load-theme 'wombat t)
;;(load-theme 'ample t)
;;(load-theme 'cyberpunk t)
;;(load-theme 'zenburn t)
;;(load-theme 'sanityinc-tomorrow-eighties t)
;;(load-theme 'leuven t)

(setq calendar-location-name "Lviv, Ukraine")
(setq calendar-latitude 49.8500)
(setq calendar-longitude 24.0167)

(require 'theme-changer)
;;(change-theme 'material-light 'material)
(change-theme 'sanityinc-tomorrow-blue 'sanityinc-tomorrow-bright)
;;(change-theme 'solarized-light 'solarized-dark)

;; linum-relative is buggy and is not quite compatible with gutter
;;(require 'linum-relative)

(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'right-fringe)

(require 'git-messenger)
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)

;; titlebars contain the buffer's name
(setq frame-title-format "%b - emacs")

;; indentation levels
(setq js-indent-level 2)
(setq ruby-indent-level 2)

;; tabs into spaces
(setq-default indent-tabs-mode nil)
;; turn off tab symbols use spaces instead
(setq indent-tabs-mode 'nil)
;; number of spaces per tab
(setq-default tab-width 2)

;; show line number
(line-number-mode t)
;; show column number
(setq column-number-mode t)

;; show the time and date
;; (display-time)
;; (setq display-time-day-and-date t)

;; set alt-g to be a "go to line <#>" command
(global-unset-key "\M-g" )
(global-set-key "\M-g" 'goto-line)

;; highlight selection
(setq transient-mark-mode t)
;; highlight matching parentheses
(show-paren-mode 1)

;; do not make backup files
(setq make-backup-files 'nil)

;; turn on font-lock in all modes that support it
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode t))

;; maximum colors
(setq font-lock-maximum-decoration t)

;; column width
(setq-default fill-column 79)
;; automatic filling depending on major mode
(auto-fill-mode 1)

;; value is in 1/10pt, so 100 will give you 10pt
;;(set-face-attribute 'default nil :height 120)

;;(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-default-font "-unknown-Liberation Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-default-font "-monotype-Andale Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")
;;(set-default-font "-unknown-Envy Code R-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")
(set-default-font "-unknown-Inconsolata LGC-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

;; open with single window
(setq inhibit-startup-screen t)
(add-hook 'emacs-startup-hook 'delete-other-windows)

;; enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq flycheck-checker-error-threshold 2000)

;;(add-to-list 'default-frame-alist '(font . "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))
;;(add-to-list 'default-frame-alist '(font . "-unknown-Droid Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))
;;(add-to-list 'default-frame-alist '(font . "-unknown-Inconsolata-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1"))
;;(add-to-list 'default-frame-alist '(font . "-unknown-Envy Code R-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1"))
(add-to-list 'default-frame-alist '(font . "-unknown-Inconsolata LGC-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))

;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 143 :width normal)))))

;; emacsclient: set cursor color
;;(add-to-list 'default-frame-alist '(cursor-color . "OliveDrab3"))
(add-to-list 'default-frame-alist '(cursor-color . "#f57e00"))
;;(add-to-list 'default-frame-alist '(cursor-color . "firebrick"))

;; emacsclient: blink cursor
(blink-cursor-mode t)

;; disable the toolbar
(tool-bar-mode -1)
;; disable the scrollbar
(scroll-bar-mode -1)
;; disable the menubar
(menu-bar-mode -1)

;; gutter does not play well with linum-relative
(global-git-gutter-mode +1)
;;(guru-global-mode +1)
(global-smartscan-mode +1)
(global-linum-mode +1)
;;(global-hl-line-mode +1)
(evil-mode +1)
(global-anzu-mode +1)
(fancy-battery-mode +1)

(defun my/turn-off-linum-mode ()
  (linum-mode -1))
(add-hook 'org-mode-hook 'my/turn-off-linum-mode)

;; windmove mode
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(setq tags-table-list
      '("~/work/rails-3.2" "~/work/delayed_job_active_record" "~/work/solano_workenv/tddium_system/build_agent" "~/work/solano_workenv/tddium_go"))

;; run emacs server
(server-start)
