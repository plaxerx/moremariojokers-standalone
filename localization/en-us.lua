
return {
    descriptions = {
        Joker = {

            j_mmj_bowser = {
                name = "Bowser",
                text = {
                    "{C:attention}Balances #1#%{} of {C:chips}Chips{} and {C:mult}Mult{}",
                    "When {C:attention}Blind{} is selected, destroys all",
                    "Jokers to the {C:attention}left{} of this Joker",
                    "{C:attention}+#2#%{} per Joker destroyed {C:inactive}(max {C:attention}#3#%{C:inactive})",
                    "{C:inactive}(destroys {C:attention}Eternal{C:inactive} Jokers)",
                },
            },
            j_mmj_bowserjr = {
                name = "Bowser Jr.",
                text = {
                    "All Jokers to the {C:attention}right{} are {C:attention}debuffed{}",
                    "Each gives {X:mult,C:white} X#1# {} Mult and has a",
                    "{C:green}#2# in #3#{} chance at end of round",
                    "to give this Joker {C:attention}+1{} Joker Slot",
                    "{C:inactive}(Currently {C:attention}+#4#{C:inactive} Joker Slots)",
                },
            },
            j_mmj_wario = {
                name = "Wario",
                text = {
                    "Earn {C:money}$#1#{} when",
                    "any Joker is triggered",
                },
            },
            j_mmj_waluigi = {
                name = "Waluigi",
                text = {
                    "All Jokers give",
                    "{X:mult,C:white} X#1# {} Mult",
                },
            },
			j_mmj_daisy = {
                name = "Daisy",
                text = {
                    "{C:attention}Retrigger{} every scored {C:attention}4{} and {C:attention}3{}",
                    "{C:attention}#1#{} time(s) for each {C:attention}Joker{} you have",
                },
            },
            j_mmj_luigi = {
                name = "Luigi",
                text = {
                    "All Jokers give",
                    "{X:chips,C:white} X#1# {} Chips",
                },
            },
			j_mmj_mario = {
                name = "Mario",
                text = {
                    "Retrigger all Jokers",
                    "{C:attention}#1#{} additional time(s)",
                    "{C:inactive}(Does not retrigger itself)",
                },
            },
			j_mmj_peach = {
                name = "Peach",
                text = {
                    "All Jokers reduce the score required of a {C:attention}Blind{} ",
                    "by {C:attention}5%{} when entering a {C:attention}Blind{} ",
					"{C:inactive}(multiplicitively){}",
                },
            },
			j_mmj_rosalina = {
                name = "Rosalina",
                text = {
                    "Creates a random {C:attention}Luma{}",
                    "at the end of each {C:attention}round{}",
                    "{C:inactive}(Must have room)",
                },
            },
            j_mmj_lakitu = {
                name = "Lakitu",
                text = {
                    "All Jokers add {C:green}#1#{} to",
                    "listed {C:green}probabilities{}",
                },
            },
            j_mmj_king_boo = { 
                name = "King Boo",
                text = {
                    "When Jokers are triggered{C:green} #1# in #2# {}chance",
                    "to upgrade Edition",
                    "{C:green} #1# in #3#{} chance to reset to Base",
                    "{C:inactive}(ex: Base -> Foil -> Holographic -> Polychrome etc.){}",
                }
            },
            j_mmj_shyguy = { 
                name = "Shy Guy",
                text = {
                    "Played numbered cards permanently gain {X:mult,C:white}X(n*#1#){} Mult, ",
                    "where {C:attention}n{} is equal to the amount of Jokers you own",
                    
                }
            },
            j_mmj_yoshi = {
				name = "Yoshi",
				text = {
					"All Jokers gain",
					"{C:money}$#1#{} of {C:attention}sell value{} when triggered",
				},
			},
            j_mmj_donkeykong = {
                name = "Donkey Kong",
                text = {
                    "All Jokers give",
                    "{C:attention}#1#{} hand size",
                }
            },
            j_mmj_toad = {
                name = "Toad",
                text = {
                    "At end of round, {C:attention}double{} every",
                    "number on half of your other {C:attention}Jokers{}",
                    "{C:inactive}(jokers chosen at random, values rounded up)",
                }
            }
        },
        Back = {
            b_mmj_n64deck = {
                name = "N64 Deck",
                text = {
                    "Start with a random {C:attention}Mario{} Joker",
                    "at start of run",
                    
                },
            },
        },
        Sleeve = {
            sleeve_mmj_n64sleeve = {
                name = "N64 Sleeve",
                text = {
                    "Start with a random {C:attention}Mario{} Joker",
                    "at start of run",
                },
            },
            sleeve_mmj_n64sleeve_alt = {
                name = "N64 Sleeve",
                text = {
                    "Start with an additional random {C:attention}Mario{} Joker",
                    "at start of run",
                    "{C:attention}+#1#{} Joker slots",
                    "{C:inactive}(Now You're Playing with Power!){}",
					"{C:red}Disables achievements{}",
                },
            },
        },

        Luma = {
            c_mmj_yellow_luma = {
                name = 'Yellow Luma',
                text = {
                    "Multiplies your {C:money}money{} by the number of",
                    "times your least played {C:attention}poker hand{} was played",
                    "{C:inactive}(Max of {C:money}$#2#{C:inactive})",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive})",
                },
            },
            c_mmj_red_luma = {
                name = 'Red Luma',
                text = {
                    "Multiplies the Mult of",
                    "all hands by {X:red,C:white} X#1# {}"
                },
            },
            c_mmj_blue_luma = {
                name = 'Blue Luma',
                text = {
                    "Multiplies the Chips of",
                    "all hands by {X:blue,C:white} X#1# {}"
                },
            },
            c_mmj_apricot_luma = {
                name = 'Apricot Luma',
                text = {
                    "{C:attention}Swaps{} the Chips and Mult",
                    "of all hands",
                },
            },
            c_mmj_black_luma = {
                name = 'Black Luma',
                text = {
                    "Levels up all hands once per",
                    "{C:attention}consumable{} you are holding",
                    "{C:inactive}(Max {C:attention}#1#{C:inactive}, currently {C:attention}#2#{C:inactive})",
                },
            },
            c_mmj_orange_luma = {
                name = 'Orange Luma',
                text = {
                    "Selected card permanently",
                    "gains {X:mult,C:white} X#1# {} Mult",
                },
            },
            c_mmj_green_luma = {
                name = 'Green Luma',
                text = {
                    "Selected card permanently",
                    "gains {X:chips,C:white} X#1# {} Chips",
                },
            },
            c_mmj_purple_luma = {
                name = 'Purple Luma',
                text = {
                    "Multiplies the Mult of all hands",
                    "by {X:red,C:white} X#1# {} and the Chips",
                    "of all hands by {X:blue,C:white} X#2# {}",
                },
            },
            c_mmj_cyan_luma = {
                name = 'Cyan Luma',
                text = {
                    "{C:attention}-#1#{} Ante",
                },
            },
            c_mmj_pink_luma = {
                name = 'Pink Luma',
                text = {
                    "Randomly grants {C:attention}+1{} Joker slot,",
                    "{C:attention}Consumable{} slot, {C:attention}hand size{},",
                    "{C:blue}hand{}, or {C:red}discard{}",
                },
            },
        },
    },
    misc = {
        dictionary = {
            mmj_daisy_give = "Take This Consumable",
        }
    },
}