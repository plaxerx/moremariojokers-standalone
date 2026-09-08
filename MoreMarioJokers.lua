local mmj = SMODS.current_mod

MMJ = { mod = mmj }

mmj.optional_features = {
	retrigger_joker = true,
	post_trigger = true,
}

function MMJ.big(x)
	if to_big then
		return to_big(x)
	end
	return x
end

function MMJ.num(x)
	if to_number then
		return to_number(x)
	end
	return tonumber(x) or x
end

function MMJ.lb(x)
	if lenient_bignum then
		return lenient_bignum(x)
	end
	return x
end

function MMJ.no_anims()
	return Talisman and Talisman.config_file and Talisman.config_file.disable_anims
end

function MMJ.balance_percent(card, percent)
	percent = math.min(percent or 0, 100)
	if percent <= 0 then
		return
	end
	local param = SMODS.Scoring_Parameters
	local chips = param and param.chips and param.chips.current
	local mult = param and param.mult and param.mult.current
	if not chips or not mult then
		return
	end
	local frac = percent / 100
	local chip_part = MMJ.big(chips) * frac
	local mult_part = MMJ.big(mult) * frac
	local avg = (chip_part + mult_part) / 2
	return {
		chip_mod = avg - chip_part,
		mult_mod = avg - mult_part,
		message = percent .. "% Balanced",
		colour = G.C.PURPLE,
		card = card,
	}
end

local JR_KEY = "j_mmj_bowserjr"

function MMJ.jr_owner()
	if not (G.jokers and G.jokers.cards) then
		return nil
	end
	for i, v in ipairs(G.jokers.cards) do
		if v.config and v.config.center_key == JR_KEY and not v.mmj_jr_gone
			and not (v.debuff and not v.mmj_jr_debuff) then
			return v, i
		end
	end
end

function MMJ.jr_signature()
	local _, index = MMJ.jr_owner()
	if not index then
		return ""
	end
	local parts = { index }
	for _, v in ipairs(G.jokers.cards) do
		parts[#parts + 1] = v.sort_id
	end
	return table.concat(parts, ",")
end

function MMJ.refresh_jr_debuffs()
	if not (G.jokers and G.jokers.cards and G.GAME and G.GAME.blind) then
		return
	end
	if MMJ.jr_refreshing then
		return
	end
	local _, index = MMJ.jr_owner()
	for i, v in ipairs(G.jokers.cards) do
		v.mmj_jr_debuff = (index and i > index) or nil
	end
	MMJ.jr_refreshing = true
	for _, v in ipairs(G.jokers.cards) do
		SMODS.recalc_debuff(v)
	end
	MMJ.jr_refreshing = false
end

function MMJ.jr_is_debuffed(card)
	return (card.debuff and card.mmj_jr_debuff) and true or false
end

function MMJ.jr_debuffed_count()
	local n = 0
	if G.jokers and G.jokers.cards then
		for _, v in ipairs(G.jokers.cards) do
			if MMJ.jr_is_debuffed(v) then
				n = n + 1
			end
		end
	end
	return n
end

function MMJ.is_immutable(card)
	local center = card and card.config and card.config.center
	return (center and center.immutable) and true or false
end

local NO_SCALE = {
	immutable = true,
	colour = true,
	id = true,
	qty = true,
	d_size = true,
	h_size = true,
	h_x_chips = true,
	card_limit = true,
	extra_slots_used = true,
	times_played = true,
	perish_tally = true,
	suit_nominal = true,
	base_nominal = true,
	face_nominal = true,
	suit_nominal_original = true,
	selected_d6_face = true,
}

local function scale_tbl(t, factor, depth)
	if depth > 4 then
		return
	end
	for k, v in pairs(t) do
		if not NO_SCALE[k] then
			if type(v) == "number" then
				if not ((k == "x_mult" or k == "Xmult" or k == "x_chips") and v == 1) then
					t[k] = v * factor
				end
			elseif type(v) == "table" then
				if is_number and is_number(v) then
					t[k] = v * factor
				else
					scale_tbl(v, factor, depth + 1)
				end
			end
		end
	end
end

function MMJ.multiply_card(card, factor)
	if not card or not card.ability or MMJ.is_immutable(card) then
		return
	end
	scale_tbl(card.ability, factor, 1)
	if card.set_cost then
		card:set_cost()
	end
end

if not IncantationAddons then
	IncantationAddons = {
		Stacking = {},
		Dividing = {},
		BulkUse = {},
		StackingIndividual = {},
		DividingIndividual = {},
		BulkUseIndividual = {},
		MassUse = {},
		MassUseIndividual = {},
	}
end

SMODS.Atlas({ key = "marioatlas", atlas_table = "ASSET_ATLAS", path = "marioatlas.png", px = 71, py = 95 })
SMODS.Atlas({ key = "luma", atlas_table = "ASSET_ATLAS", path = "luma.png", px = 71, py = 95 })
SMODS.Atlas({ key = "mariosleeves", atlas_table = "ASSET_ATLAS", path = "mariosleeves.png", px = 73, py = 95 })
SMODS.Atlas({ key = "mariodecks", atlas_table = "ASSET_ATLAS", path = "mariodecks.png", px = 71, py = 95 })

assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/lumas.lua"))()
assert(SMODS.load_file("src/decks.lua"))()
assert(SMODS.load_file("src/ui.lua"))()

for _, center in pairs(SMODS.Centers) do
	if center.mod == mmj then
		center.unlocked = true
		center.discovered = true
	end
end
