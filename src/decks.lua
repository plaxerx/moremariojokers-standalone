local DECK_KEY = "b_mmj_n64deck"
local COMBO_JOKER_SLOTS = 5

local N64_JOKERS = {
	"j_mmj_wario",
	"j_mmj_waluigi",
	"j_mmj_mario",
	"j_mmj_peach",
	"j_mmj_rosalina",
	"j_mmj_daisy",
	"j_mmj_king_boo",
	"j_mmj_shyguy",
	"j_mmj_lakitu",
	"j_mmj_yoshi",
	"j_mmj_donkeykong",
	"j_mmj_luigi",
	"j_mmj_bowser",
	"j_mmj_bowserjr",
}
function MMJ.n64_pool()
	local pool = {}
	for _, key in ipairs(N64_JOKERS) do
		if G.P_CENTERS[key] then
			pool[#pool + 1] = key
		end
	end
	return pool
end

local function grant_random_mario_joker(seed)
	G.E_MANAGER:add_event(Event({
		func = function()
			if not G.jokers then
				return false
			end
			local pool = MMJ.n64_pool()
			if #pool > 0 then
				SMODS.add_card({ key = pseudorandom_element(pool, pseudoseed(seed)) })
			end
			return true
		end,
	}))
end

function MMJ.on_n64_deck()
	local g = G.GAME
	if not g then
		return false
	end

	local back = g.selected_back
	local key = back and back.effect and back.effect.center and back.effect.center.key
	if key then
		return key == DECK_KEY
	end

	local sbk = g.selected_back_key
	if type(sbk) == "table" then
		return sbk.key == DECK_KEY
	end
	if type(sbk) == "string" then
		return sbk == DECK_KEY
	end
	return false
end

SMODS.Back({
	key = "n64deck",
	atlas = "mariodecks",
	pos = { x = 0, y = 0 },
	config = {},
	apply = function(self)
		grant_random_mario_joker("n64deck")
	end,
})

if next(SMODS.find_mod("CardSleeves")) then
	CardSleeves.Sleeve({
		key = "n64sleeve",
		name = "N64 Sleeve",
		atlas = "mariosleeves",
		pos = { x = 0, y = 0 },
		unlocked = true,
		discovered = true,
		config = {},

		loc_vars = function(self)
			if self.get_current_deck_key() == DECK_KEY then
				return { key = self.key .. "_alt", vars = { COMBO_JOKER_SLOTS } }
			end
			return { key = self.key }
		end,

		apply = function(self, sleeve)
			CardSleeves.Sleeve.apply(self)
			grant_random_mario_joker("n64sleeve")

			if MMJ.on_n64_deck() then
				G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + COMBO_JOKER_SLOTS
				G.GAME.seeded = true
			end
		end,
	})
end

for _, list in ipairs({
	"Stacking",
	"Dividing",
	"BulkUse",
	"StackingIndividual",
	"DividingIndividual",
	"BulkUseIndividual",
	"MassUse",
	"MassUseIndividual",
}) do
	table.insert(IncantationAddons[list], "Luma")
end
