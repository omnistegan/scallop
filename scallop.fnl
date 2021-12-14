(local lib (require "scallop-lib"))
(local {: arst : oien} lib.text)
(local {: hrule} lib.elem)

(local {: mm : topt} (require "units"))
(local {: usepackage : directlua} (require "scallop-tex"))

(fn preamble []
  (let [width (* 157 mm) height (* 209 mm)]
    (usepackage
     :geometry
     {:portrait true
      :landscape false
      :paperwidth (topt width)
      :paperheight (topt height)
      :hmargin (topt (* 0.05 width))
      :vmargin (topt (* 0.05 height))})
    (usepackage :fontenc :T1)
    (usepackage :plex-otf {:usefilenames true :DefaultFeatures {:Ligatures :Common}})))

(fn inner []
  (arst)
  (hrule)
  (arst)
  (hrule)
  (oien))

{: preamble : inner : lib}
