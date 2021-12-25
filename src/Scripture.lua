local BibleServiceType = require(script.Parent.BibleServiceType)
local LoadFunctions = require(script.Parent.LoadFunctions)

local Scripture = {}
Scripture.__index = Scripture

function Scripture.new(version, optionalParams)
	local scripture = {
		_version = version,
	}

	if version == nil or version == "KJV" then
		if version == nil then
			warn("version was not specified; setting to KJV")
		end

		scripture._bibleService = BibleServiceType.APIBible
		scripture._id = "de4e12af7f28f599-02"
	else
		scripture._bibleService = optionalParams.bibleService or BibleServiceType.APIBible
		scripture._id = optionalParams.id
	end

	setmetatable(scripture, Scripture)

	return scripture
end

function Scripture:load(startingVerse, endingVerse)
	assert(startingVerse ~= nil, "verse(s) not specified")
	assert(
		startingVerse ~= nil or (endingVerse ~= nil and startingVerse.bookName ~= endingVerse.bookName),
		"starting and ending verses must be of the same book"
	)

	local bibleService = self._bibleService
	local load = LoadFunctions[bibleService]

	assert(load ~= nil, "load function not found")

	return load(startingVerse, endingVerse)
end

return Scripture
