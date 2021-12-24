local Scripture = require(script.Parent.Scripture)
local BibleServiceType = require(script.Parent.BibleServiceType)

local bindablesFolder = script.Parent.Bindables

local apiKeys = {}

function setAPIKey(bibleServiceType, key)
	bibleServiceType = bibleServiceType or BibleServiceType.APIBible

	assert(BibleServiceType[bibleServiceType] ~= nil, "Bible service type is not valid; check valid types in the BibleLoader.BibleServiceType enum.")
	assert(typeof(key) == "string", "key must be a string")

	apiKeys[bibleServiceType] = key
end

function getAPIKey(bibleServiceType)
	bibleServiceType = bibleServiceType or BibleServiceType.APIBible
	assert(BibleServiceType[bibleServiceType] ~= nil, "Bible service type is not valid; check valid types in the BibleLoader.BibleServiceType enum.")

	return apiKeys[bibleServiceType]
end

bindablesFolder.GetAPIKey.OnInvoke = getAPIKey

return {
	setAPIBibleKey = setAPIKey,
	getAPIBibleKey = getAPIKey,

	Scripture = Scripture,
	BibleServiceType = BibleServiceType,
}
