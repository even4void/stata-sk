(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/org-plus-contrib-20180514")
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/htmlize-20180412.1244/")
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/ess-20180610.800/lisp")
(require 'ess-stata-mode)
(require 'org)
(load "ox-bibtex.el")
(setq inferior-STA-program-name "/usr/local/bin/stata")
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively nil
      org-html-htmlize-output-type nil)
(setq ess-ask-for-ess-directory nil)
(org-babel-do-load-languages 'org-babel-load-languages '((stata . t)))
(org-add-link-type "stata" #'ignore #'my/export-stata-link)
(defun my/export-stata-link (path desc format)
  "Export org stata links to hmtl."
  (cl-case format
    (html (format "<a href=\"https://www.stata.com/help.cgi?%s\" class=\"stata\">%s</a>" path (or desc "")))
    (latex (format "\"%s\")" path))))
