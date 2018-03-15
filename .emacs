;; auto-complete
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'sql-mode)

;; line numbers
(setq linum-format "%d ")
(global-linum-mode 1)

;; c-mode indentation
(setq indent-tabs-mode t)
(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)

;; text-mode indentation
(add-hook 'text-mode-hook
	  '(lambda ()
	     (setq indent-tabs-mode t)
	     (setq tab-width 4)
	     (setq indent-line-function (quote insert-tab))))

;; jump to file
(global-set-key "\C-x\ j" 'ffap)

;; Default split vertically
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Set the large file limit at 100mb
(setq large-file-warning-threshold 100000000)

;; stolen from https://www.emacswiki.org/emacs/EmacsTags
;;; View tags other window
(defun view-tag-other-window (tagname &optional next-p regexp-p)
  "Same as `find-tag-other-window' but doesn't move the point"
  (interactive (find-tag-interactive "View tag other window: "))
  (let ((window (get-buffer-window)))
    (find-tag-other-window tagname next-p regexp-p)
    (recenter 0)
    (select-window window)))
(global-set-key "\M-," 'view-tag-other-window)
;;(visit-tags-table "~/TAGS" t)

(provide '.emacs)
