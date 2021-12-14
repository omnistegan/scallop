(local pt (^ 2 16))
(local bp (* pt 1.00374))
(local dd (* pt 1.07))

(local em (* pt 10))
(local ex (* em 0.43056))
(local pc (* pt 12))

(local mm (* pt 2.84526))
(local cm (* mm 10))

(local in (* cm 2.54))

(fn topt [n]
  (.. (/ n (^ 2 16)) "pt"))

{: pt : bp : dd : em : ex : pc : mm : cm : in : topt}
