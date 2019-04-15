;; FIXME Find a way to make the following independant of ELPA versioning
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/org-plus-contrib-20190415")
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/htmlize-20180923.1829")
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/ess-20190415.625")

;; Required stuff
(require 'ess-stata-mode)
(require 'org)
(load "ox-bibtex.el")

;; Setup default settings
(setq inferior-STA-program "/usr/local/bin/stata-mp"
      org-confirm-babel-evaluate nil
      org-src-fontify-natively nil
      org-html-htmlize-output-type nil
      ess-ask-for-ess-directory nil)
(org-babel-do-load-languages 'org-babel-load-languages '((stata . t)))

;; Add-ons
(org-add-link-type "span" #'ignore
                   #'(lambda (class desc format)
                       (pcase format
                         (`html (format "<span class=\"%s\">%s</span>"
                                        class
                                        (or desc "")))
                         (_ (or desc "")))))
(org-add-link-type "stata" #'ignore #'my/export-stata-link)
(defun my/export-stata-link (path desc format)
  "Export org stata links to html."
  (cl-case format
    (html (format "<a href=\"https://www.stata.com/help.cgi?%s\" class=\"stata\">%s</a>" path (or desc "")))
    (latex (format "\"%s\")" path))))
