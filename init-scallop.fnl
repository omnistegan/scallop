(local {: directlua :print-tex-macro t\ : print} (require "scallop-tex"))

(fn init []
  (directlua "scallop = require(\"scallop\")")
  (directlua "scallop.preamble()")
  (t\ :begin nil :document)
  (directlua "scallop.inner()")
  (t\ :end nil :document))

{ : init }
