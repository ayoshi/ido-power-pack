;; Always reset the theme before the change - fixes a lot of small problems
(install-packs '(flx-ido
                 iflipb))

(require 'flx-ido)
(flx-ido-mode 1)

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

(global-set-key [C-tab] 'iflipb-next-buffer)
(global-set-key [C-S-tab] 'iflipb-previous-buffer-buffer)
