# Learning Ledger

A Claude skill that makes analogies cumulative, plus the real ledger it built while I learned NLP.

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

## How to use the skill
Add `skill/SKILL.md` as a custom skill in Claude (Claude.ai settings, or `~/.claude/skills/analogy-ledger/SKILL.md` for Claude Code). Then learn as usual. The ledger is kept in Claude's memory, or in a local `analogy-ledger.md` file.

## Results
_Filled in at the end of the month: concepts covered, analogies tried, landed vs failed, and what I noticed._
