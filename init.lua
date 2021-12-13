local fennel = require("fennel")
table.insert(package.loaders or package.searchers, fennel.searcher)
local init = require("init-scallop")
init.init()
