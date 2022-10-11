--data-updates.lua

-- miniloaders
local prefixes = {
	["chute-"] = "a",
	["basic-"] = "b",
	[""] = "c",
	["fast-"] = "d",
	["express-"] = "e",
	["space-"] = "f",
	["deep-space-"] = "g"
}
for prefix, order in pairs(prefixes) do
	local loader = data.raw["item"][prefix .. "miniloader"]
	local filter_loader = data.raw["item"][prefix .. "filter-miniloader"]
	if loader then
		loader.subgroup = "miniloaders"
		loader.order = "a" .. order .. "a[miniloader]"
	end
	if filter_loader then
		filter_loader.subgroup = "miniloaders"
		filter_loader.order = "a" .. order .. "b[miniloader]"
	end
end

-- junctions
local tjunc = data.raw["item"]["pipe-junction"]
local elbow = data.raw["item"]["pipe-elbow"]
local straight = data.raw["item"]["pipe-straight"]
if tjunc then tjunc.order = "a[pipe]-a[pipe]-a" end
if elbow then elbow.order = "a[pipe]-a[pipe]-b" end
if straight then straight.order = "a[pipe]-a[pipe]-c" end

-- space junctions
local stjunc = data.raw["item"]["space-pipe-t-junction"]
local selbow = data.raw["item"]["space-pipe-elbow-junction"]
local sstraight = data.raw["item"]["space-pipe-straight-junction"]
if stjunc then stjunc.order = "a[pipe]-s[space]-aa" end
if selbow then selbow.order = "a[pipe]-s[space]-ab" end
if sstraight then sstraight.order = "a[pipe]-s[space]-ac" end

-- circuit network to schall group
local invsens = data.raw["item"]["item-sensor"]
local ghstscn = data.raw["item"]["ghost-scanner"]
if invsens then
	invsens.subgroup = "circuit-combinator"
	invsens.group = "circuit"
end
if ghstscn then
	ghstscn.subgroup = "circuit-combinator"
	ghstscn.group = "circuit"
end

-- autolinked chest
local alchest = data.raw["item"]["Schall-autolinked-chest-1"]
if alchest then
	alchest.subgroup = "container-1"
	alchest.order = "z" .. alchest.order
end
