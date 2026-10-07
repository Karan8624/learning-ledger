# Learning Ledger

**Everyone learns differently. Learning Ledger helps an AI tutor learn how *you* learn, so you can learn efficiently, at your own pace, in your own way.**

It is a Claude skill, plus the real ledger it built while I learned NLP. It does not label anyone with a "learning style". It tracks evidence of what actually landed for this person on this topic, and keeps adapting.

## The problem
Analogies are the fastest way to understand a new concept, but in most learning sessions they are thrown away after one use. The next concept gets a brand-new analogy, sometimes from a completely different world, and nothing connects.

## The idea
Keep a **ledger** of every concept and every analogy used to explain it, with whether it **landed**, is **untested**, or **failed** (and why). Before explaining something new:

1. reuse an analogy that already worked, or extend one from a related concept;
2. if none fits, generate a few candidates and pick the best with a fixed rubric (track record, familiarity, coherence, structural fit, break severity);
3. always say where the analogy breaks;
4. record the outcome.

## Repo structure
| Path | What |
|---|---|
| `skill/SKILL.md` | The Claude skill |
| `ledger/analogy-ledger.md` | My real ledger, updated as I learn |
| `log/` | Weekly notes: what I learned, which analogies landed or failed |

## How it adapts
- **Efficiently:** reuses analogies that already worked, never repeats failed ones, and targets the weak side (the why or the how).
- **At your own pace:** reads signals like "slow down" or shorter answers and changes the step size.
- **Your own way:** uses your own worlds (games, sports, cooking) and the formats that work for you (visuals, tables, code).

## How to use the skill
See [skill/INSTALL.md](skill/INSTALL.md). In short: enable code execution, then upload [`dist/learning-ledger-skill.zip`](dist/learning-ledger-skill.zip) in Claude under Customize → Skills. The ledger is kept in Claude's memory, or in a local `analogy-ledger.md` file.

## Results
_Filled in at the end of the month: concepts covered, analogies tried, landed vs failed, and what I noticed._

## Versions
- v1 (4 Oct 2026): analogy ledger with landed / untested / failed statuses and a selection rubric.
- v2 (5 Oct 2026): universal: any learner and subject, first-session start-up, in-chat adaptation signals, learner profile, review and recall. Renamed to learning-ledger.
