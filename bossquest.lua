-- These are quest items that once gained by the lootmaster, will no longer show on corpse to loot or aren't shown due to not being on the right faction. You should comment out the quest items you haven't completed yet.

boss_quest_items = {
	["Kel'Thuzad"] = { "\124cffa335ee\124Hitem:22520:0:0:0:0:0:0:0:0\124h[The Phylactery of Kel'Thuzad]\124h\124r" },
	["Erennius"] = { "\124cffa335ee\124Hitem:61652:0:0:0:0:0:0:0:0\124h[Claw of Erennius]\124h\124r" },
	["Solnius"] = { "\124cffa335ee\124Hitem:61444:0:0:0:0:0:0:0:0\124h[Smoldering Dream Essence]\124h\124r",
	                "\124cffa335ee\124Hitem:61215:0:0:0:0:0:0:0:0\124h[Head of Solnius]\124h\124r" }, -- Smoldering doesn't always drop
	["Ossirian the Unscarred"] = { "\124cffa335ee\124Hitem:21220:0:0:0:0:0:0:0:0\124h[Head of Ossirian the Unscarred]\124h\124r" }
}

local englishFaction, _ = UnitFactionGroup("player")
if (englishFaction == "Alliance") then
	boss_quest_items["Nefarian"] = { "\124cffa335ee\124Hitem:19002:0:0:0:0:0:0:0:0\124h[Head of Nefarian (Horde)]\124h\124r" } -- So Alliance ML can roll horde head
elseif (englishFaction == "Horde") then
	boss_quest_items["Nefarian"] = { "\124cffa335ee\124Hitem:19003:0:0:0:0:0:0:0:0\124h[Head of Nefarian (Alliance)]\124h\124r" } -- So Horde ML can roll Alliance head
end

-- force the game to query all boss_quest_items by setting them as a tooltip
for bossName, bossDrops in pairs(boss_quest_items) do
	for _, fakelink in pairs(bossDrops) do
		local _, _, itemIdStr = string.find(fakelink, "item:(%d+)")
		local itemId = tonumber(itemIdStr)
		GameTooltip:SetHyperlink("item:" .. itemId .. ":0:0:0")
		DEFAULT_CHAT_FRAME:AddMessage("|cff20b2aa->|r |cffffd700Quest item loaded: " .. fakelink .. "|r|cffead454")
	end
end
