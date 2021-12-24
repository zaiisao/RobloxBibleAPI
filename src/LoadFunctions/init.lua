local BibleServiceType = require(script.Parent.BibleServiceType)

return {
	[BibleServiceType.APIBible] = require(script.apibible),
	[BibleServiceType.ESV] = require(script.esv),
}
