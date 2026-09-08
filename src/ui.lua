local base_buildAdditionsTab = buildAdditionsTab

local BUTTON_W = 5
local BUTTON_H = 1.4

function buildAdditionsTab(mod)
	local base_tab = base_buildAdditionsTab(mod)
	if not (mod and MMJ and MMJ.mod and mod.id == MMJ.mod.id) then
		return base_tab
	end

	local ok, tab = pcall(function()
		local buttons = {}

		local function add(id, label, pool, colour, text_colour)
			if not pool then
				return
			end
			local tally = modsCollectionTally(pool)
			if tally.of > 0 then
				buttons[#buttons + 1] = UIBox_button({
					button = id,
					label = { label },
					count = tally,
					minw = BUTTON_W,
					minh = BUTTON_H,
					id = id,
					colour = colour,
					text_colour = text_colour,
				})
			end
		end

		add("your_collection_jokers", localize("b_jokers"), G.P_CENTER_POOLS.Joker)
		add("your_collection_decks", localize("b_decks"), G.P_CENTER_POOLS.Back)
		add("your_collection_vouchers", localize("b_vouchers"), G.P_CENTER_POOLS.Voucher)

		for _, key in ipairs(SMODS.ConsumableType.visible_buffer) do
			add(
				"your_collection_" .. string.lower(key) .. "s",
				localize("b_" .. string.lower(key) .. "_cards"),
				G.P_CENTER_POOLS[key],
				G.C.SECONDARY_SET[key],
				G.C.UI[key]
			)
		end

		if create_UIBox_Other_GameObjects() then
			buttons[#buttons + 1] = UIBox_button({
				button = "your_collection_other_gameobjects",
				label = { localize("k_other") },
				minw = BUTTON_W,
				minh = BUTTON_H,
				id = "your_collection_other_gameobjects",
				focus_args = { snap_to = true },
			})
		end

		if #buttons == 0 then
			return nil
		end

		local split = math.ceil(#buttons / 2)
		local left, right = {}, {}
		for i, node in ipairs(buttons) do
			local col = i <= split and left or right
			col[#col + 1] = node
		end

		local columns = { { n = G.UIT.C, config = { align = "cm", padding = 0.15 }, nodes = left } }
		if right[1] then
			columns[#columns + 1] = { n = G.UIT.C, config = { align = "cm", padding = 0.15 }, nodes = right }
		end

		return {
			label = localize("b_additions"),
			chosen = SMODS.LAST_SELECTED_MOD_TAB == "additions" or false,
			tab_definition_function = function()
				SMODS.LAST_SELECTED_MOD_TAB = "additions"
				return {
					n = G.UIT.ROOT,
					config = {
						emboss = 0.05,
						minh = 6,
						minw = 6,
						r = 0.1,
						align = "cm",
						padding = 0.2,
						colour = G.C.BLACK,
					},
					nodes = {
						{ n = G.UIT.R, config = { align = "cm", padding = 0.15 }, nodes = columns },
					},
				}
			end,
		}
	end)

	if not ok or not tab then
		return base_tab
	end
	return tab
end
