(local {: mkhrule} (require "scallop-nodes"))
(local {: mm} (require "units"))
(local {: directlualib} (require "scallop-tex"))

(local {:add pladd : write} (require "pagelist"))
(local {: mkdest} (require "dest"))

(fn newline [] (tex.print " \\\\ "))

(fn oien [] (tex.print "oien"))
(fn arst [] (tex.print "arst"))

;; Node manipultation fns that use pagelist and end with write
(fn line []
  (let [[n _] [(mkdest)]]
    (pladd n)
    (pladd (mkhrule (* 0.1 mm)))
    (write)))


;; Combined tex.print and node manipulation using directlua to call back in.
(fn hrule []
  (newline)
  (directlualib :elem.line)
  (newline))

{: newline
 :elem {: line : hrule}
 :text {: oien : arst}}
