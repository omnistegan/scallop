(var pagelist nil)

(lambda write []
  (let [[vbox b] [(node.vpack pagelist)]]
    (set pagelist nil)
    (node.write vbox)))

(lambda add [list]
  (if (not (= nil pagelist))
      (let [tail (node.tail pagelist)]
        (tset tail :next list)
        (tset list :prev tail))
      (set pagelist list)))

{: write : add}
