(local {: directlua : tex-macro-str} (require "scallop-tex"))

(fn preamble []
  (directlua "scallop = require(\"scallop\")")
  (directlua "scallop.preamble()"))

(fn inner []
  (directlua "scallop.inner()"))

;; how to compose class?
(fn init []
  (tex.print (tex-macro-str :documentclass nil :minimal))
  (preamble)
  (tex.print (tex-macro-str :begin nil :document))
  (inner)
  (tex.print (tex-macro-str :end nil :document)))

{ : init }
