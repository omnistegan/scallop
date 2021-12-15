(local {: mkhrule} (require "scallop-nodes"))
(local {: mm : pt} (require "units"))
(local {: directlualib : print :print-tex-macro t\ : \\} (require "scallop-tex"))

(local {:add pladd : write} (require "pagelist"))
(local {: mkdest} (require "dest"))

;; This fn is called via directlualib, which for now does not support args
(fn line []
  (let [[n _] [(mkdest)]]
    (pladd n)
    (pladd (mkhrule (* 0.1 pt)))
    (write)))

;; Combined tex.print and node manipulation using directlua to call back in.
(fn hrule []
  (directlualib :elem.line))

(fn lined [font-size color]
  (t\ :color nil color)
  (t\ :fontsize nil [font-size font-size])
  (t\ :selectfont)
  (t\ :noindent)
  (let [line-count
        (-> tex.vsize (/ pt)
            (- (/ font-size 3)) ;; small adjust is needed to make sure we don't go to next page
            (/ font-size) (math.floor))]
    (for [i 1 line-count] (hrule)))
  (t\ :clearpage))

{:elem {: line : hrule : lined}}
