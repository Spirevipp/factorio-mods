--data-updates.lua

-- miniloaders
if mods["miniloader"] then
	local mlprefixes = {
		["chute-"] = "zz",
		[""] = "xa",
		["fast-"] = "xb",
		["express-"] = "xc",
		["kr-advanced-"] = "xd",
		["kr-superior-"] = "xe",
		["space-"] = "xf",
		["deep-space-"] = "xg",
	}
	for prefix, order in pairs(mlprefixes) do
		local loader = data.raw["item"][prefix .. "miniloader"]
		local filter_loader = data.raw["item"][prefix .. "filter-miniloader"]
		if loader then
			loader.subgroup = "miniloaders"
			loader.order = order .. "-miniloader"
		end
		if filter_loader then
			filter_loader.subgroup = "miniloaders-filtered"
			filter_loader.order = order .. "-miniloader"
		end
	end
end

--ducts
if mods["FluidMustFlow"] then
	data.raw["item"]["duct-small"].subgroup = "ducts"
	data.raw["item"]["duct"].subgroup = "ducts"
	data.raw["item"]["duct-long"].subgroup = "ducts"
	data.raw["item"]["duct-t-junction"].subgroup = "ducts"
	data.raw["item"]["duct-curve"].subgroup = "ducts"
	data.raw["item"]["duct-cross"].subgroup = "ducts"
	data.raw["item"]["duct-underground"].subgroup = "ducts"
	data.raw["item"]["non-return-duct"].subgroup = "ducts"
	data.raw["item"]["duct-end-point-intake"].subgroup = "ducts"
	data.raw["item"]["duct-end-point-outtake"].subgroup = "ducts"
end

--manifolds
if mods["Manifolds"] then
	data.raw["item"]["manifold-1x3"].subgroup = "manifolds"
	data.raw["item"]["manifold-1x5"].subgroup = "manifolds"
	data.raw["item"]["manifold-1x7"].subgroup = "manifolds"
	data.raw["item"]["manifold-1x9"].subgroup = "manifolds"
end

--noxys waterfill -> dectorio terrain group
if mods["Noxys_Waterfill"] and mods["Dectorio"] then
	data.raw["item"]["waterfill"].group = "dectorio"
	data.raw["item"]["waterfill"].subgroup = "waterfill"
	data.raw["item"]["deepwaterfill"].group = "dectorio"
	data.raw["item"]["deepwaterfill"].subgroup = "waterfill"
	data.raw["item"]["shallowwaterfill"].group = "dectorio"
	data.raw["item"]["shallowwaterfill"].subgroup = "waterfill"
	data.raw["item"]["mudwaterfill"].group = "dectorio"
	data.raw["item"]["mudwaterfill"].subgroup = "waterfill"
	data.raw["item"]["waterfill-green"].group = "dectorio"
	data.raw["item"]["waterfill-green"].subgroup = "waterfill"
	data.raw["item"]["deepwaterfill-green"].group = "dectorio"
	data.raw["item"]["deepwaterfill-green"].subgroup = "waterfill"

end

-- junctions
if mods["Flow Control"] then
	data.raw["item"]["pipe-junction"].order = "a[pipe]-a[pipe]-a"
	data.raw["item"]["pipe-elbow"].order = "a[pipe]-a[pipe]-b"
	data.raw["item"]["pipe-straight"].order = "a[pipe]-a[pipe]-c"
end

-- space junctions
if mods["space-pipe-junctions"] then
	data.raw["item"]["space-pipe-t-junction"].order = "a[pipe]-s[space]-aa"
	data.raw["item"]["space-pipe-elbow-junction"].order = "a[pipe]-s[space]-ab"
	data.raw["item"]["space-pipe-straight-junction"].order = "a[pipe]-s[space]-ac"
end


-- circuit network to schall group
if mods["SchallCircuitGroup"] then
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
end


-- autolinked chest
if mods["SchallAutolinkedChest"] then
	local x = data.raw["item"]["Schall-autolinked-chest-1"];
	x.subgroup = "container-1"
	x.order = "z" .. x.order
end
