SMODS.Joker {
	name = "mmj-Luigi",
	key = "luigi",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 }	,
	config = { extra = { x_chips = 2.5 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_chips } }
	end,
	rarity = 4,
	cost = 20,
	order = 86,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.other_joker and context.other_joker.ability.set == "Joker" then
			if not MMJ.no_anims() then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				message = localize({ type = "variable", key = "a_xchips", vars = { card.ability.extra.x_chips } }),
				colour = G.C.CHIPS,
				Xchip_mod = card.ability.extra.x_chips,
			}
		end
	end,
	atlas = "marioatlas",
	cry_credits = {
		idea = {
			"Auto Watto"
		},
		art = {
			"Auto Watto",
			"Linus Goof Balls"
		},
		code = {
			"Auto Watto"
		}
	},
}
SMODS.Joker {
	name = "mmj-Mario",
	key = "mario",
	config = { extra = { retriggers = 2 } },
	pos = { x = 0, y = 2 },
	soul_pos = { x = 1, y = 2 },
	rarity = 4,
	order = 85,
	cost = 20,
	blueprint_compat = true,
	immutable = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.retriggers } }
	end,
	atlas = "marioatlas",
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card then
			return {
				message = localize("k_again_ex"),
				repetitions = card.ability.extra.retriggers,
				card = card,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Auto Watto"
		},
		art = {
			"Linus Goof Balls",
			"MarioFan597"
		},
		code = {
			"Auto Watto"
		}
	},
}

SMODS.Joker({
	name = "mmj-Waluigi",
	key = "waluigi",
	pos = { x = 4, y = 3 },
	soul_pos = { x = 5, y = 3 },
	config = { extra = { Xmult = 2.5 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.Xmult) } }
	end,
	rarity = 4,
	cost = 20,
	order = 87,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.other_joker and context.other_joker.ability.set == "Joker" then
			if not MMJ.no_anims() then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				xmult = MMJ.lb(card.ability.extra.Xmult),
			}
		end
		if context.forcetrigger then
			return {
				xmult = MMJ.lb(card.ability.extra.Xmult),
			}
		end
	end,
	atlas = "marioatlas",
	cry_credits = {
		idea = { "HexaCryonic" },
		art = { "MarioFan597", "HexaCryonic" },
		code = { "Math" },
	},
})

SMODS.Joker({
	name = "mmj-Wario",
	key = "wario",
	pos = { x = 4, y = 4 },
	soul_pos = { x = 5, y = 4 },
	config = { extra = { money = 3 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { number_format(center.ability.extra.money) } }
	end,
	rarity = 4,
	cost = 20,
	order = 88,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if
			(
				context.post_trigger
				and not context.other_context.fixed_probability
				and not context.other_context.mod_probability
			) or context.forcetrigger
		then
			return {
				dollars = MMJ.lb(card.ability.extra.money),
				card = context.other_context and context.other_context.blueprint_card or context.other_card or nil,
			}
		end
	end,
	atlas = "marioatlas",
	cry_credits = {
		idea = { "Auto Watto" },
		art = { "MarioFan597" },
		code = { "Auto Watto" },
	},
})

	SMODS.Joker {
		name = "mmj-Peach",
		key = "peach",
		pos = { x = 0, y = 1 },
		soul_pos = { x = 1, y = 1 },
		config = { extra = {  } },
		loc_vars = function(self, info_queue, center)
			return { vars = { } }
		end,
		rarity = 4,
		cost = 20,
		order = 86,
		blueprint_compat = true,
		calculate = function(self, card, context)
			if context.setting_blind then
				for i = 1, #G.jokers.cards do
					if not MMJ.no_anims() then
						G.E_MANAGER:add_event(Event({
							func = function()
								card_eval_status_text(G.jokers.cards[i], 'extra', nil, nil, nil, {message = "-5% Blind Size", colour = G.C.DARK_EDITION});
								return true
							end,
						}))
					end
					G.GAME.blind.chips = (MMJ.big(G.GAME.blind.chips) * MMJ.big(0.95))
				end
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				return nil, true
			end
		end,
		atlas = "marioatlas",
		cry_credits = {
			idea = {
				"Denverplays2"
			},
			art = {
				"SMG9000",
				"MarioFan597"
			},
			code = {
				"SMG9000"
			}
		},
	}
	SMODS.Joker {
		name = "mmj-Daisy",
		key = "daisy",
		pos = { x = 0, y = 3 },
		soul_pos = { x = 1, y = 3 },
		config = {
			extra = { retriggers = 1 },
			immutable = { max_retriggers = 25 },
		},
		loc_vars = function(self, info_queue, center)
			return { vars = { math.min(center.ability.immutable.max_retriggers, center.ability.extra.retriggers) } }
		end,
		rarity = 4,
		cost = 20,
		order = 86,
		blueprint_compat = true,
		calculate = function(self, card, context)
			if context.repetition then
				if context.cardarea == G.play then
					if context.other_card:get_id() == 4 or context.other_card:get_id() == 3 then
						return {
							message = localize("k_again_ex"),
							repetitions = MMJ.num(
								math.min(card.ability.immutable.max_retriggers * #G.jokers.cards, card.ability.extra.retriggers * #G.jokers.cards)
							),
							card = card,
						}
					end
				end
			end
		end,
		atlas = "marioatlas",
		cry_credits = {
			idea = {
				"MarioFan597"
			},
			art = {
				"SMG9000"
			},
			code = {
				"SMG9000"
			}
		},
	}
	SMODS.Joker {
		name = "mmj-KingBoo",
		key = "king_boo",
		pos = { x = 2, y = 4 },
		soul_pos = { x = 3, y = 4	 },
		config = { extra = { odds1 = 10, odds2 = 100,  } },
		loc_vars = function(self, info_queue, center)
			return { vars = {"" .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds1, center.ability.extra.odds2} }
		end,
		rarity = 4,
		cost = 20,
		order = 86,
		blueprint_compat = true,
		calculate = function(self, card, context)
			if context.post_trigger then 
				local _card = context.other_card
				local chance1 
				local chance2 
				local chance3 
				local chance4 
				if pseudorandom("mmj-KingBoo") < G.GAME.probabilities.normal/card.ability.extra.odds1 then
					chance1 = true
				else 
					chance1 = false
					chance3 = true
				end
				if pseudorandom("mmj-KingBoo") < G.GAME.probabilities.normal/card.ability.extra.odds2 then
					chance2 = true
				else 
					chance2 = false
					chance4= true
				end
				if chance1 == true or chance2 == true then
					if chance1 == true then
						G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.75,
						func = function() --"borrowed" from Wheel Of Fortune
							local found_index = 1
							if _card.edition then 	
								for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
									if v.key == _card.edition.key then
										found_index = i
										break
									end
								end
							end
							found_index = found_index + 1
							if found_index > #G.P_CENTER_POOLS.Edition then
								found_index = found_index - #G.P_CENTER_POOLS.Edition
							end
							
							local edition_apply = G.P_CENTER_POOLS.Edition[found_index].key
							_card:set_edition((edition_apply or "e_foil"), true)
							
							return true
						end,
					}))
					card_eval_status_text(_card, 'extra', nil, nil, nil, { message = "Upgrade!"})
					end
					if chance2 == true then
						G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.75,
						func = function()
							_card:set_edition("e_base", true)
							
							return true
						end,
					}))
					card_eval_status_text(_card, 'extra', nil, nil, nil, { message = "Reset:("})			

					end
				elseif chance1 == false and chance2 == false then
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.75,
						func = function() --"borrowed" from Wheel Of Fortune
							attention_text({
								text = localize("k_nope_ex"),
								scale = 1.3,
								hold = 1.4,
								major = _card,
								backdrop_colour = G.C.PURPLE,
								align = (
									G.STATE == G.STATES.TAROT_PACK
									or G.STATE == G.STATES.SPECTRAL_PACK
									or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
								)
										and "tm"
									or "cm",
								offset = {
									x = 0,
									y = (
										G.STATE == G.STATES.TAROT_PACK
										or G.STATE == G.STATES.SPECTRAL_PACK
										or G.STATE == G.STATES.SMODS_BOOSTER_OPENED
									)
											and -0.2
										or 0,
								},
								silent = true,
							})
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0.06 * G.SETTINGS.GAMESPEED,
								blockable = false,
								blocking = false,
								func = function()
									play_sound("tarot2", 0.76, 0.4)
									return true
								end,
							}))
							play_sound("tarot2", 1, 0.4)
							_card:juice_up(0.3, 0.5)
							return true
						end,
					}))
				end
				return nil, true
			end

		end,
		atlas = "marioatlas",
		cry_credits = {
			idea = {
				"Glitchkat10 (kierkat10)"
			},
			art = {
				"SMG9000"
			},
			code = {
				"SMG9000"
			}
		},
	}
	SMODS.Joker {
		name = "mmj-Shyguy",
		key = "shyguy",
		pos = { x = 4, y = 1 },
		soul_pos = { x = 5, y = 1	 },
		config = { extra = { xmult_mult = 0.1,   } },
		loc_vars = function(self, info_queue, card)
            return {vars = {card.ability.extra.xmult_mult}}
        end,
		rarity = 4,
		cost = 20,
		order = 86,
		blueprint_compat = true,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.individual then
				if not context.other_card:is_face() then
					context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
					context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + (#G.jokers.cards*card.ability.extra.xmult_mult)
					return {
						extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
						colour = G.C.MULT,
						card = context.other_card
					}
				end
			end 
        end,
		atlas = "marioatlas",
		cry_credits = {
			idea = {
				"Glitchkat10 (kierkat10)"
			},
			art = {
				"Lexi",
				"candycanearter"
			},
			code = {
				"SMG9000"
			}
		},
	}
	SMODS.Joker {
		name = "mmj-DonkeyKong",
		key = "donkeykong",
		pos = { x = 2, y = 1 },
		soul_pos = { x = 3, y = 1 },
		config = { extra = { handsize = 0, h_mod = 1 } },
		rarity = 4,
		cost = 20,
		order = 87,
		blueprint_compat = false,
		loc_vars = function(self, info_queue, center)
			return { vars = { center.ability.extra.h_mod } }
		end,
		remove_from_deck = function(self, card, from_debuff)
			G.hand:change_size(-(card.ability.extra.handsize * card.ability.extra.h_mod))
		end,
		update = function(self, card, dt)
			if (card.area == G.jokers) and G.hand and (G.jokers and G.jokers.cards) then
				if #G.jokers.cards ~= card.ability.extra.handsize and #G.jokers.cards <= 1000 then
					G.hand:change_size(math.floor(math.min(1000, (#G.jokers.cards - card.ability.extra.handsize) * card.ability.extra.h_mod)))
					card.ability.extra.handsize = #G.jokers.cards
				end
			end
		end,
		atlas = "marioatlas",
		cry_credits = {
			idea = { "Denverplays2" },
			art = { "Gud username" },
			code = { "Auto Watto", "SDM_0" },
		},
	}
	SMODS.Joker {
		name = "mmj-Toad",
		key = "toad",
		pos = { x = 0, y = 4 },
		soul_pos = { x = 1, y = 4 },
		rarity = 4,
		cost = 20,
		order = 87,
		immutable = true,
		calculate = function(self, card, context)
			if context.end_of_round and not context.individual and not context.repetition then
				local viable_cards = {}
				for i = 1, #G.jokers.cards do
					if not MMJ.is_immutable(G.jokers.cards[i]) then
						table.insert(viable_cards, i)
					end
				end
				local modified_cards = {}
				for i = 1, math.ceil(#viable_cards/2) do
					local chosen_card, pwcwin = pseudorandom_element(viable_cards, pseudoseed("Toad"))
					table.insert(modified_cards, chosen_card )
					table.remove(viable_cards, pwcwin)
				end
				table.sort(modified_cards)
				for i = 1, #modified_cards do
					local _card = modified_cards[i]
					MMJ.multiply_card(G.jokers.cards[_card], 2)
					G.E_MANAGER:add_event(Event({
							func = function()
								G.jokers.cards[_card]:juice_up(0.8, 0.5)
								card_eval_status_text(G.jokers.cards[_card], 'extra', nil, nil, nil, {message = "Increased", colour = G.C.DARK_EDITION});
								return true
							end,
						}))
				end
				
				
			end
		end,
		atlas = "marioatlas",
		cry_credits = {
			idea = { "MarioFan597" },
			art = { "Yamper" },
			code = { "SMG9000" },
		},
	}


SMODS.Joker({
	name = "mmj-Rosalina",
	key = "rosalina",
	pos = { x = 2, y = 3 },
	soul_pos = { x = 3, y = 3 },
	config = {},
	loc_vars = function(self, info_queue, center)
		return { vars = {} }
	end,
	rarity = 4,
	cost = 20,
	order = 86,
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.end_of_round and not context.individual and not context.repetition
			and not context.blueprint
			and #G.consumeables.cards < G.consumeables.config.card_limit then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					local luma = create_card("Luma", G.consumeables, nil, nil, nil, nil, nil, "rosalina")
					luma:add_to_deck()
					G.consumeables:emplace(luma)
					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = "+1 Luma",
						colour = G.C.SECONDARY_SET.Luma,
					})
					return true
				end,
			}))
			return nil, true
		end
	end,
	atlas = "marioatlas",
	cry_credits = {
		idea = { "Denverplays2" },
		art = { "GeorgeTheRat", "MarioFan597" },
		code = { "SMG9000" },
	},
})

SMODS.Joker({
	name = "mmj-Lakitu",
	key = "lakitu",
	pos = { x = 4, y = 0 },
	soul_pos = { x = 5, y = 0 },
	config = {
		extra = { prob_add = 1 },
		immutable = { applied_prob = 0 },
	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prob_add } }
	end,
	rarity = 4,
	cost = 20,
	order = 86,
	blueprint_compat = false,

	remove_from_deck = function(self, card, from_debuff)
		local applied = card.ability.immutable.applied_prob
		if applied ~= 0 then
			for k, v in pairs(G.GAME.probabilities) do
				G.GAME.probabilities[k] = v - applied
			end
			card.ability.immutable.applied_prob = 0
		end
	end,

	update = function(self, card, dt)
		if not (G.jokers and card.added_to_deck) then
			return
		end
		local bonus = #G.jokers.cards * card.ability.extra.prob_add
		local applied = card.ability.immutable.applied_prob
		if bonus ~= applied then
			for k, v in pairs(G.GAME.probabilities) do
				G.GAME.probabilities[k] = v - applied + bonus
			end
			card.ability.immutable.applied_prob = bonus
		end
	end,

	atlas = "marioatlas",
	cry_credits = {
		idea = { "Glitchkat10 (kierkat10)" },
		art = { "candycanearter", "Gud username" },
		code = { "SMG9000" },
	},
})

SMODS.Joker({
	name = "mmj-Yoshi",
	key = "yoshi",
	pos = { x = 4, y = 2 },
	soul_pos = { x = 5, y = 2 },
	config = { extra = { money = 3 } },
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.money } }
	end,
	rarity = 4,
	cost = 20,
	order = 87,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.post_trigger then
			for _, v in ipairs(G.jokers.cards) do
				if v.set_cost then
					v.ability.extra_value = (v.ability.extra_value or 0) + card.ability.extra.money
					v:set_cost()
				end
			end
			return {
				message = localize("k_val_up"),
				colour = G.C.MONEY,
				card = context.other_context.blueprint_card or context.other_card,
			}
		end
	end,
	atlas = "marioatlas",
	cry_credits = {
		idea = { "SMG9000" },
		art = { "Auto Watto" },
		code = { "Auto Watto", "SDM_0" },
	},
})

SMODS.Joker({
	name = "mmj-Bowser",
	key = "bowser",
	pos = { x = 2, y = 0 },
	soul_pos = { x = 3, y = 0 },
	config = { extra = { percent = 0, gain = 5, max = 100 } },
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				center.ability.extra.percent,
				center.ability.extra.gain,
				center.ability.extra.max,
			},
		}
	end,
	rarity = 4,
	cost = 20,
	order = 85,
	blueprint_compat = false,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint and not card.getting_sliced then
			local victims = {}
			for _, v in ipairs(G.jokers.cards) do
				if v == card then
					break
				end
				if not v.getting_sliced then
					victims[#victims + 1] = v
				end
			end
			if #victims > 0 then
				card.ability.extra.percent = math.min(
					card.ability.extra.percent + #victims * card.ability.extra.gain,
					card.ability.extra.max
				)
				SMODS.destroy_cards(victims, { bypass_eternal = true })
				return {
					message = "Devoured!",
					colour = G.C.RED,
					card = card,
				}
			end
		end

		if context.joker_main then
			return MMJ.balance_percent(card, card.ability.extra.percent)
		end
	end,
	atlas = "marioatlas",
})

SMODS.Joker({
	name = "mmj-BowserJr",
	key = "bowserjr",
	pos = { x = 2, y = 2 },
	soul_pos = { x = 3, y = 2 },
	config = { extra = { xmult = 0.25, odds = 20, jkr_slots = 0 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult,
				"" .. (G.GAME and G.GAME.probabilities.normal or 1),
				card.ability.extra.odds,
				card.ability.extra.jkr_slots,
			},
		}
	end,
	rarity = 4,
	cost = 20,
	order = 85,
	blueprint_compat = false,

	add_to_deck = function(self, card, from_debuff)
		if from_debuff then
			return
		end
		card.mmj_jr_gone = nil
		MMJ.jr_signature_cache = nil
		if G.jokers then
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jkr_slots
		end
	end,

	remove_from_deck = function(self, card, from_debuff)
		if from_debuff then
			return
		end
		if G.jokers then
			G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jkr_slots
		end
		card.mmj_jr_gone = true
		MMJ.jr_signature_cache = nil
		MMJ.refresh_jr_debuffs()
	end,

	update = function(self, card, dt)
		if MMJ.jr_owner() ~= card then
			return
		end
		local signature = MMJ.jr_signature()
		if signature ~= MMJ.jr_signature_cache then
			MMJ.jr_signature_cache = signature
			MMJ.refresh_jr_debuffs()
		end
	end,

	calculate = function(self, card, context)
		if context.debuff_card then
			if context.debuff_card.mmj_jr_debuff then
				return { debuff = true }
			end
			return
		end

		if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
			local gained = 0
			for _, v in ipairs(G.jokers.cards) do
				if MMJ.jr_is_debuffed(v)
					and pseudorandom("bowserjr") < G.GAME.probabilities.normal / card.ability.extra.odds then
					gained = gained + 1
				end
			end
			if gained > 0 then
				card.ability.extra.jkr_slots = card.ability.extra.jkr_slots + gained
				G.jokers.config.card_limit = G.jokers.config.card_limit + gained
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.DARK_EDITION,
					card = card,
				}
			end
		end

		if context.joker_main then
			local debuffed = MMJ.jr_debuffed_count()
			if debuffed > 0 then
				if not MMJ.no_anims() then
					for _, v in ipairs(G.jokers.cards) do
						if MMJ.jr_is_debuffed(v) then
							local target = v
							G.E_MANAGER:add_event(Event({
								func = function()
									target:juice_up(0.5, 0.5)
									return true
								end,
							}))
						end
					end
				end
				return {
					xmult = MMJ.lb(MMJ.big(card.ability.extra.xmult) ^ debuffed),
					card = card,
				}
			end
		end
	end,
	atlas = "marioatlas",
})
