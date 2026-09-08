# More Mario Jokers - Standalone

A Cryptid-free fork of [smg9000/Cryptid-MoreMarioJokers](https://github.com/smg9000/Cryptid-MoreMarioJokers)
by SMG9000, Denverplays2 and MarioFan597 for my own personal use. Some Jokers were modified versus the original
and additional concepts were materialized against existing card art such as Lumas.

## Do not install this alongside Cryptid-MoreMarioJokers!!

Running with **Cryptid itself is fine.** but use the original version is preferred.

## Requirements

- Steamodded `>=1.0.0~BETA-1501a` (developed against `1.0.0~BETA-1814a`)
- Lovely

**Optional** Talisman (big numbers), CardSleeves (the N64 sleeve), Incantation (stacking and mass-use on Lumas).

## Contents

### Jokers

| Joker | Effect |
| --- | --- |
| Mario | Retriggers all Jokers 2 additional times |
| Luigi | All Jokers give X2.5 Chips |
| Wario | Earn $3 whenever any Joker is triggered |
| Waluigi | All Jokers give X2.5 Mult |
| Peach | Each Joker shrinks the Blind's required score by 5% on Blind select |
| Daisy | Retriggers every scored 4 and 3 once per Joker you own |
| Rosalina | Creates a random Luma at the end of each round |
| Lakitu | All Jokers add +1 to listed probabilities |
| Bowser | Balances 0% of Chips and Mult. Destroys every Joker to its left on Blind select, giving +5% each up to 100% per destroyed Joker (Eternals included) |
| Bowser Jr. | Debuffs every Joker to its right; each debuffed Joker gives X0.25 Mult and has a 1 in 20 chance per round to grant +1 Joker Slot |
| King Boo | On Joker trigger, 1 in 10 to bump its Edition, 1 in 100 to reset it to Base |
| Shy Guy | Played numbered cards permanently gain X(n×0.1) Mult, n = Joker count |
| Yoshi | All Jokers gain $3 of sell value when triggered |
| Donkey Kong | +1 hand size per Joker |
| Toad | At end of round, permanently doubles every number on half your other Jokers |


### Lumas

Ten new consumables called **Lumas** directly tied to **Rosalina**, which creates
one at the end of each round if you have a free consumable slot.

| Luma | Effect |
| --- | --- |
| Yellow | Multiplies money by your least-played hand's play count, capped at $100 |
| Red | X2 Mult to all hands |
| Blue | X2 Chips to all hands |
| Apricot | Swaps Chips and Mult on all hands |
| Black | Levels all hands once per consumable held, capped at 5 |
| Pink | Randomly grants +1 Joker slot, Consumable slot, hand size, hand, or discard |
| Orange | Selected card permanently gains X1.1 Mult |
| Green | Selected card permanently gains X1.1 Chips |
| Purple | X1.5 Mult and X1.5 Chips to all hands |
| Cyan | -1 Ante |

### N64 deck and sleeve

Both are on the wiki and in `main`, and neither shipped in the zip.

| | Effect |
| --- | --- |
| N64 deck | Start with a random Mario Joker |
| N64 Sleeve | Start with a random Mario Joker |
| Deck **+** Sleeve | Both Jokers, **+5 Joker slots**, and **achievements are disabled** for the run |

Upstream gave the deck and the sleeve `joker_slot = 5` *each*, unconditionally —
wearing the sleeve on the deck handed you +10 slots and two free Legendaries with
no downside. Here each half only grants its Joker, and the +5 is the combo bonus,
paid for with the run not counting.

Achievements go off through `G.GAME.seeded`, the flag vanilla's
`unlock_achievement` and `check_for_unlock` already gate on. It survives
save/load.

## Credits and license

GPL-3.0.

Everything built, the Jokers, the card art, the Luma
sprites, the N64 deck and sleeve is the work of the original team, and the
credit for it belongs to them:

**More Mario Jokers** — [SMG9000, Denverplays2 and MarioFan597](https://github.com/smg9000/Cryptid-MoreMarioJokers),
with per-card contributions from Auto Watto, GeorgeTheRat, Gud username,
candycanearter, Yamper, HexaCryonic, Glitchkat10 (kierkat10) and SDM_0. The
per-card idea/art/code credits are kept intact in each Joker's `cry_credits`
table in `src/jokers.lua`.

**Cryptid** — MathIsFun_ and the Cryptid/Balatro Discords, for Wario and Waluigi
and their art.

Built with the assistance of Claude.
