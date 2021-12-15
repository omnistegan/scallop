(local {: \\} (require "scallop-tex"))

(lambda mkrule [{: width : depth : height}]
  (let [r (node.new :rule)]
    (tset r :width width)
    (tset r :height height)
    (tset r :depth depth)
    (\\)
    r))

(lambda mkhrule [height]
  (mkrule {:height (/ height 2) :depth (/ height 2)
           :width tex.hsize}))

{: mkrule : mkhrule}
