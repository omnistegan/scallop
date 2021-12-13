(local {: error : invoke-restart : make-condition} (require :fennel-conditions))
(import-macros {: handler-bind : restart-case : define-condition} :fennel-conditions)

(fn preamble []
  (.. "\\directlua{sc = require(\"scallop\")} "
      "\\directlua{sc.preamble()}"))

(fn inner []
  (.. "\\directlua{sc.inner()}"))

;; how to compose class?
(fn init []
  (tex.print
   (.. "\\documentclass{minimal} "
       (preamble)
       " \\begin{document} "
       (inner)
       " \\end{document}")))

{ : init }
