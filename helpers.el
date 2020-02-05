;;; -*- lexical-binding: t; -*-

;;
;;; Variables

(defun find-present-buffer ()
  (find-buffer-visiting "emacs.org"))

(defvar present-buffer nil)
(setq present-buffer (find-present-buffer))

(defun return-to-present ()
  (interactive)
  (switch-to-buffer present-buffer)
  (doom/window-maximize-buffer))

(defun pop-buffer ()
  (interactive)
  (let
      ((new-buffer (generate-new-buffer "demo")))
    (when (eq (current-buffer) present-buffer)
      (when (= 1 (count-windows))
        (split-window-right))
      (other-window 1))
    (switch-to-buffer new-buffer)
    (persp-add-buffer new-buffer)))

(defvar cursor-hidden nil)
(defun toggle-cursor ()
  (interactive)
  (if cursor-hidden
      (org-present-show-cursor)
    (org-present-hide-cursor))
  (setq cursor-hidden (not cursor-hidden)))

(global-set-key (kbd "<f5>") 'return-to-present)
(global-set-key (kbd "<f6>") 'pop-buffer)
(global-set-key (kbd "<f12>") 'toggle-cursor)
(setq split-window-threshold 60)
