(fn options-str [t]
  (var s "")
  (each [k v (pairs t)]
    (if (= (type v) :table)
        (set s (.. s "," k "=" "{" (options-str v) "}"))
        (= v true)
        (set s (.. s "," k))
        (set s (.. s "," k "=" (tostring v)))))
  (s:sub 2))

(fn tex-macro-str [name opts body]
  (let [optstr (if (= (type opts) :table)
                   (.. "[" (options-str opts) "]")
                   opts (.. "[" opts "]")
                   "")
        bodystr (if body (.. "{" body "}") "")]
     (.. " \\" name optstr bodystr " ")))

(fn usepackage [body opts]
  (tex.print (tex-macro-str :usepackage opts body)))

(fn directlua [luastr]
  (tex.print (tex-macro-str :directlua nil luastr)))

(fn directlualib [str]
  (directlua (.. "scallop.lib." str "()")))

{: usepackage : directlua : directlualib : tex-macro-str }
