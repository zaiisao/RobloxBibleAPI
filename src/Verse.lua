local Verse = {}
Verse.__index = Verse

function Verse.new(bookName, chapterNumber, verseNumber)
	local verse = {
		bookName = bookName,
		chapterNumber = chapterNumber,
		verseNumber = verseNumber,
	}

	setmetatable(verse, Verse)

	return verse
end

return Verse
