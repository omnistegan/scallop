(local {: print} tex)

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
  "name is the first part of the macro, directly after \\\\
opts can either be a string or table. Tables will be made into
a string. Body can also be a (presumed seq) table. The multiple
strings will be options in curlies

//name[optsBool,optsStr=str,optsTable={nestedBool}]{body-only-or-first}{other-in-body-table}"
  (let [optstr (if (= (type opts) :table)
                   (.. "[" (options-str opts) "]")
                   opts (.. "[" opts "]")
                   "")
        bodystr (if (= (type body) :table)
                    (do (var s "") (each [_ v (ipairs body)] (set s (.. s "{" v "}"))) s)
                    body
                    (.. "{" body "}")
                    "")]
     (.. " \\" name optstr bodystr " ")))

(fn print-tex-macro [...]
  (print (tex-macro-str ...)))

(fn usepackage [body opts]
  (print-tex-macro :usepackage opts body))

(fn directlua [luastr]
  (print-tex-macro :directlua nil luastr))

(fn directlualib [str]
  (directlua (.. "scallop.lib." str "()")))

(fn \\ [] (print-tex-macro "\\"))

{: usepackage
 : directlua
 : directlualib
 : \\
 : tex-macro-str
 : print-tex-macro
 : print}
