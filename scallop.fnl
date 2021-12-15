;; lib must be exported as `lib` exactly for hacky directlualib to work
(local lib (require "scallop-lib"))
(local {: lined} lib.elem)

(local {: mm : topt} (require "units"))
(local {: usepackage : print : \\ :print-tex-macro t\ } (require "scallop-tex"))

;; documentclass must be exported
(fn preamble []
  (let [
        ;; width (* 91 mm) height (* 122 mm) ;; poke
        ;; width (* 119 mm) height (* 158 mm) ;; nova
        width (* 157 mm) height (* 209 mm) ;; note
        ;; width (* 203 mm) height (* 270 mm) ;; lumi

        orientation :portrait
        [left right top bottom] [6.29 9.05 6.40 12.36]] ;; margins in %

    (t\ :documentclass nil :minimal)

    ;; 16 tones of gray (including white and black) 16 is black, 1 is white
    (usepackage :luacolor)
    (for [i 1 16 1]
      (t\ :definecolor nil [(.. "gray" i) "gray" (- 1 (* i 0.0625))]))

    ;; relevant items defined above in let binding, unless you want non-% for margins
    ;;   make sure to feed these options units (`topt`) rather than huge ints (see units)
    (usepackage
     :geometry
     {:portrait (= orientation :portrait)
      :landscape (= orientation :landscape)
      :paperwidth (topt width)
      :paperheight (topt height)
      :left (topt (* (/ left 100) width))
      :right (topt (* (/ right 100) width))
      :top (topt (* (/ top 100) height))
      :bottom (topt (* (/ bottom 100) height))})

    ;; Plex otf fonts
    (usepackage :fontenc :T1)
    (usepackage :plex-otf {:usefilenames true :DefaultFeatures {:Ligatures :Common}})))

(fn inner []
  (t\ :noindent)
  (print "What follows will be 10 pages of 12pt lined paper")
  (\\)
  (print "This was typeset with luatex and fennel")
  (t\ :clearpage)
  (for [i 1 10]
    (lined 12 :gray10)))

{: preamble : inner : lib}
