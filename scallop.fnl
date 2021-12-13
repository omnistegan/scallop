(local lib (require "scallop-lib"))

(local pt (^ 2 16))
(local bp (* pt 1.00374))
(local dd (* pt 1.07))

(local em (* pt 10))
(local ex (* em 0.43056))
(local pc (* pt 12))

(local mm (* pt 2.84526))
(local cm (* mm 10))

(local in (* cm 2.54))


(var pagelist nil)

(lambda write []
  (let [[vbox b] [(node.vpack pagelist)]]
    (set pagelist nil)
    (node.write vbox)))

(lambda add-to-page [list]
  (if (not (= nil pagelist))
      (let [tail (node.tail pagelist)]
        (tset tail :next list)
        (tset list :prev tail))
      (set pagelist list)))

(lambda mkrule [{: width : depth : height}]
  (let [r (node.new :rule)]
    (tset r :width width)
    (tset r :height height)
    (tset r :depth depth)
    r))

(lambda mkhrule [height]
  (mkrule {:height (/ height 2) :depth (/ height 2)
           :width (- tex.pagewidth tex.pageleftoffset tex.pagerightoffset)}))

(var destcounter 0)

(lambda mkdest []
  (set destcounter (+ 1 destcounter))
  (let [d (node.new :whatsit :pdf_dest)]
    (tset d :named_id 0)
    (tset d :dest_id destcounter)
    (tset d :dest_type 3)
    (values d destcounter)))

(fn line []
  (let [[n dest] [(mkdest)]]
    (add-to-page n)
    (add-to-page (mkhrule (* 0.2 mm)))
    (write)))



(fn arst [] (tex.print "arst"))

(fn preamble []
  (tex.print (.. "\\usepackage[T1]{fontenc} "
                 "\\usepackage[usefilenames,DefaultFeatures={Ligatures=Common}]{plex-otf}")))

(fn inner []
  (arst)
  (lib.oien))

{: preamble : line : inner }
