SMODS.ConsumableType {
	key = "Luma",
	primary_colour = HEX("424e54"),
	secondary_colour = HEX("70adb9"),
	collection_rows = {5,5},
	loc_txt = {
		collection = "Luma Cards",
		name = "Luma",
		label = "Luma",
		undiscovered = {
			name = 'Undiscovered Luma',
			text = { 'Find this Luma in a run to discover it' },
		},
	},
	shop_rate = 0,
	default = 'c_mmj_yellow_luma',
	can_stack = true,
	can_divide = true,
}

MMJ.Luma = SMODS.Consumable:extend {
	set = "Luma",
	can_use = function(self, card) 
		return true
	end,
}

SMODS.UndiscoveredSprite {
	key = 'Luma',
	atlas = 'luma',
	pos = {x = 4, y = 1},
}

local function least_played_hand()
	local hand, played = "High Card", nil
	for _, v in ipairs(G.handlist) do
		if G.GAME.hands[v].visible and G.GAME.hands[v].played > 0 then
			if not played or G.GAME.hands[v].played <= played then
				hand, played = v, G.GAME.hands[v].played
			end
		end
	end
	return hand, played or 0
end

MMJ.Luma({
	key = "mmj_yellow_luma",
	pos = { x = 0, y = 0 },
	cost = 4,
	atlas = "luma",
	config = { extra = { max_gain = 100 } },
	loc_vars = function(self, info_queue, center)
		local hand = least_played_hand()
		return { vars = { hand, center.ability.extra.max_gain } }
	end,
	use = function(self, card, area, copier)
		local _, played = least_played_hand()
		local gain = MMJ.big(G.GAME.dollars) * math.max(played, 1) - MMJ.big(G.GAME.dollars)
		local cap = MMJ.big(card.ability.extra.max_gain)
		if gain > cap then
			gain = cap
		end
		if gain > MMJ.big(0) then
			ease_dollars(gain)
		end
	end,
	bulk_use = function(self, card, area, copier, number)
		for _ = 1, number do
			self:use(card, area, copier)
		end
	end,
})

MMJ.Luma({
	key = "mmj_red_luma",
	pos = { x = 1, y = 0 },
	cost = 4,
	atlas = "luma",
	config = { extra = { xmult = 2 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.xmult } }
	end,
	use = function(self, card, area, copier)
		for _, v in ipairs(G.handlist) do
			G.GAME.hands[v].mult = G.GAME.hands[v].mult * card.ability.extra.xmult
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
		)
		update_hand_text(
			{ sound = "tarot1", volume = 0.7, pitch = 1, delay = 1 },
			{ mult = "X" .. number_format(card.ability.extra.xmult), StatusText = true }
		)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		for _, v in ipairs(G.handlist) do
			G.GAME.hands[v].mult = G.GAME.hands[v].mult * (MMJ.big(card.ability.extra.xmult) ^ number)
		end
	end,
})

MMJ.Luma({
	key = "mmj_blue_luma",
	pos = { x = 2, y = 0 },
	cost = 4,
	atlas = "luma",
	config = { extra = { xchips = 2 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.xchips } }
	end,
	use = function(self, card, area, copier)
		for _, v in ipairs(G.handlist) do
			G.GAME.hands[v].chips = G.GAME.hands[v].chips * card.ability.extra.xchips
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
		)
		update_hand_text(
			{ sound = "tarot1", volume = 0.7, pitch = 1, delay = 1 },
			{ chips = "X" .. number_format(card.ability.extra.xchips), StatusText = true }
		)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		for _, v in ipairs(G.handlist) do
			G.GAME.hands[v].chips = G.GAME.hands[v].chips * (MMJ.big(card.ability.extra.xchips) ^ number)
		end
	end,
})

MMJ.Luma({
	key = "mmj_apricot_luma",
	pos = { x = 1, y = 1 },
	cost = 4,
	atlas = "luma",
	config = { extra = {} },
	loc_vars = function(self, info_queue, center)
		return { vars = {} }
	end,
	use = function(self, card, area, copier)
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
		)
		update_hand_text(
			{ sound = "tarot1", volume = 0.7, pitch = 1, delay = 1 },
			{ mult = "Swap", chips = "Swap", StatusText = true }
		)
		for _, v in ipairs(G.handlist) do
			G.GAME.hands[v].chips, G.GAME.hands[v].mult = G.GAME.hands[v].mult, G.GAME.hands[v].chips
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		if number % 2 == 1 then
			self:use(card, area, copier)
		end
	end,
})

MMJ.Luma({
	key = "mmj_black_luma",
	pos = { x = 4, y = 0 },
	cost = 4,
	atlas = "luma",
	config = { extra = { max_levels = 5, times_total = 0 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.max_levels, center.ability.extra.times_total } }
	end,
	update = function(self, card, dt)
		if G.consumeables and G.consumeables.cards then
			card.ability.extra.times_total = math.min(#G.consumeables.cards, card.ability.extra.max_levels)
		end
	end,
	use = function(self, card, area, copier)
		local levels = card.ability.extra.times_total
		if levels <= 0 then
			return
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
		)
		update_hand_text({ delay = 0 }, { mult = "+", StatusText = true })
		update_hand_text({ delay = 0 }, { chips = "+", StatusText = true })
		update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { level = "+" .. tostring(levels) })
		delay(1.3)
		for k, _ in pairs(G.GAME.hands) do
			level_up_hand(card, k, true, levels)
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		local levels = card.ability.extra.times_total * number
		if levels <= 0 then
			return
		end
		for k, _ in pairs(G.GAME.hands) do
			level_up_hand(card, k, true, levels)
		end
	end,
})

local PINK_BOONS = {
	{
		message = "+1 Joker Slot",
		colour = G.C.DARK_EDITION,
		apply = function()
			G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
			G.jokers.config.card_limit = G.jokers.config.card_limit + 1
		end,
	},
	{
		message = "+1 Consumable Slot",
		colour = G.C.SECONDARY_SET.Tarot,
		apply = function()
			G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots + 1
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
		end,
	},
	{
		message = "+1 Hand Size",
		colour = G.C.ORANGE,
		apply = function()
			G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
			G.hand:change_size(1)
		end,
	},
	{
		message = "+1 Hand",
		colour = G.C.BLUE,
		apply = function()
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
			ease_hands_played(1)
		end,
	},
	{
		message = "+1 Discard",
		colour = G.C.RED,
		apply = function()
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
			ease_discard(1)
		end,
	},
}

MMJ.Luma({
	key = "mmj_pink_luma",
	pos = { x = 5, y = 0 },
	cost = 4,
	atlas = "luma",
	config = { extra = {} },
	loc_vars = function(self, info_queue, center)
		return { vars = {} }
	end,
	use = function(self, card, area, copier)
		local boon = pseudorandom_element(PINK_BOONS, pseudoseed("pink_luma"))
		boon.apply()
		card_eval_status_text(card, "extra", nil, nil, nil, {
			message = boon.message,
			colour = boon.colour,
		})
	end,
	bulk_use = function(self, card, area, copier, number)
		for _ = 1, number do
			self:use(card, area, copier)
		end
	end,
})

local function perma_bonus(card, key, message, colour)
	local target = G.hand and G.hand.highlighted and G.hand.highlighted[1]
	if not target then
		return
	end
	target.ability[key] = (target.ability[key] or 0) + card.ability.extra.gain
	local total = target.ability[key]
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.2,
		func = function()
			play_sound("tarot1")
			target:juice_up(0.3, 0.5)
			card_eval_status_text(target, "extra", nil, nil, nil, {
				message = "X" .. number_format(1 + total) .. " " .. message,
				colour = colour,
			})
			return true
		end,
	}))
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.3,
		func = function()
			G.hand:unhighlight_all()
			return true
		end,
	}))
end

local function one_card_selected(self, card)
	return G.hand and G.hand.highlighted and #G.hand.highlighted == 1
end

MMJ.Luma({
	key = "mmj_orange_luma",
	pos = { x = 0, y = 1 },
	cost = 4,
	atlas = "luma",
	config = { extra = { gain = 0.1 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { 1 + center.ability.extra.gain } }
	end,
	can_use = one_card_selected,
	use = function(self, card, area, copier)
		perma_bonus(card, "perma_x_mult", "Mult", G.C.MULT)
	end,
	bulk_use = function(self, card, area, copier, number)
		for _ = 1, number do
			self:use(card, area, copier)
		end
	end,
})

MMJ.Luma({
	key = "mmj_green_luma",
	pos = { x = 3, y = 0 },
	cost = 4,
	atlas = "luma",
	config = { extra = { gain = 0.1 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { 1 + center.ability.extra.gain } }
	end,
	can_use = one_card_selected,
	use = function(self, card, area, copier)
		perma_bonus(card, "perma_x_chips", "Chips", G.C.CHIPS)
	end,
	bulk_use = function(self, card, area, copier, number)
		for _ = 1, number do
			self:use(card, area, copier)
		end
	end,
})

MMJ.Luma({
	key = "mmj_purple_luma",
	pos = { x = 3, y = 1 },
	cost = 4,
	atlas = "luma",
	config = { extra = { xmult = 1.5, xchips = 1.5 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.xmult, center.ability.extra.xchips } }
	end,
	use = function(self, card, area, copier)
		for _, v in ipairs(G.handlist) do
			G.GAME.hands[v].mult = G.GAME.hands[v].mult * card.ability.extra.xmult
			G.GAME.hands[v].chips = G.GAME.hands[v].chips * card.ability.extra.xchips
		end
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
			{ handname = localize("k_all_hands"), chips = "...", mult = "...", level = "" }
		)
		update_hand_text({ sound = "tarot1", volume = 0.7, pitch = 1, delay = 1 }, {
			mult = "X" .. number_format(card.ability.extra.xmult),
			chips = "X" .. number_format(card.ability.extra.xchips),
			StatusText = true,
		})
		update_hand_text(
			{ sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
			{ mult = 0, chips = 0, handname = "", level = "" }
		)
	end,
	bulk_use = function(self, card, area, copier, number)
		for _, v in ipairs(G.handlist) do
			G.GAME.hands[v].mult = G.GAME.hands[v].mult * (MMJ.big(card.ability.extra.xmult) ^ number)
			G.GAME.hands[v].chips = G.GAME.hands[v].chips * (MMJ.big(card.ability.extra.xchips) ^ number)
		end
	end,
})

MMJ.Luma({
	key = "mmj_cyan_luma",
	pos = { x = 2, y = 1 },
	cost = 4,
	atlas = "luma",
	config = { extra = { ante = 1 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.ante } }
	end,
	can_use = function(self, card)
		return G.GAME and G.GAME.round_resets.ante - card.ability.extra.ante >= 1
	end,
	use = function(self, card, area, copier)
		ease_ante(-card.ability.extra.ante)
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante
	end,
	bulk_use = function(self, card, area, copier, number)
		for _ = 1, number do
			if self:can_use(card) then
				self:use(card, area, copier)
			end
		end
	end,
})
