;; Always reset the theme before the change - fixes a lot of small problems
(install-packs '(flx-ido
                 iflipb))

(require 'flx-ido)
(flx-ido-mode 1)

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

(global-set-key [C-tab] 'iflipb-next-buffer)
(global-set-key [C-S-tab] 'iflipb-previous-buffer-buffer)

;; sort ido filelist by mtime instead of alphabetically
(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
(defun ido-sort-mtime ()
  (setq ido-temp-list
        (sort ido-temp-list
              (lambda (a b)
                (let ((a-tramp-file-p (string-match-p ":\\'" a))
                      (b-tramp-file-p (string-match-p ":\\'" b)))
                  (cond
                   ((and a-tramp-file-p b-tramp-file-p)
                    (string< a b))
                   (a-tramp-file-p nil)
                   (b-tramp-file-p t)
                   (t (time-less-p
                       (sixth (file-attributes (concat ido-current-directory b)))
                       (sixth (file-attributes (concat ido-current-directory a))))))))))
  (ido-to-end  ;; move . files to end (again)
   (delq nil (mapcar
              (lambda (x) (and (char-equal (string-to-char x) ?.) x))
              ido-temp-list))))


;; Use ignored extension list
(setq ido-ignore-extensions t)
