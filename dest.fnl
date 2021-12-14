(var destcounter 0)

(lambda mkdest []
  (set destcounter (+ 1 destcounter))
  (let [d (node.new :whatsit :pdf_dest)]
    (tset d :named_id 0)
    (tset d :dest_id destcounter)
    (tset d :dest_type 3)
    (values d destcounter)))

{: mkdest}
