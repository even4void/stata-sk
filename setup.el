;; Now I use my whole Doom Emacs config instead of requiring
;; individual pieces of Org modules one at a time. (because
;; jupyter-mode)
(load (expand-file-name "init.el" user-emacs-directory))
(require 'org)
(load "ox-bibtex.el")

