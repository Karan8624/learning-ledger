---
name: analogy-ledger
description: Use when teaching or explaining a concept: picks the best analogy from the learner's stored ledger, builds on past ones, and records which analogies landed or failed.
---

# Analogy Ledger

A learning approach that makes analogies cumulative. Every concept a learner studies gets one or more analogies stored in a persistent ledger. New concepts are explained by extending analogies that already worked, so understanding builds on itself instead of restarting each time.

## Where the ledger lives

- Primary: Claude's memory, in a file named `learning/analogy-ledger.md` (inside whatever folder the memory system requires for this session or project).
- Fallback, if no memory tools are available: a local file `analogy-ledger.md` in the learner's working folder.
- Read the ledger before explaining anything. If it does not exist yet, create it with the template below the first time an analogy is used.

## Ledger format

```markdown
# Analogy ledger

## Learner profile
- Familiar worlds: (e.g. RPG games, manhwa, cricket, cooking), taken only from what the learner has said
- What tends to work: (e.g. concrete tables, visuals, building code right away)

## Concepts

### embedding (NLP)
- Related: vector, cosine similarity, parameters
- A1: RPG stat sheet. Status: landed. Maps: word/sentence = character, 384 numbers = stats, similar meaning = similar build. Breaks: real stats have no names and are learned, not designed.
- A2: sliders. Status: failed. Why: learner confused it with a sliding window. Do not reuse.
```

Status values: `landed` (learner restated it correctly or applied it), `untested` (used, no clear signal yet), `failed` (caused confusion; record why and never reuse).

## Workflow for every explanation

1. **Read the ledger.** Find the concept itself, its prerequisites, and its neighbors (the `Related` lines).
2. **Reuse before inventing.** If the concept already has a `landed` analogy, use it, extending it to the new detail.
3. **Otherwise, generate 2-3 candidates** and pick one with the rubric below. Prefer candidates that extend an analogy already used for a neighboring concept.
4. **Explain in this order:**
   - the analogy in one or two sentences;
   - a short mapping (analogy part → real part), as a small table when there are 3+ parts;
   - **where the analogy breaks** (always, in one line; an analogy with no stated limit plants misconceptions);
   - one check question that makes the learner use the analogy, not just repeat it.
5. **Read the signal.** Correct restatement or application → `landed`. Confusion, a wrong inference traceable to the analogy, or "I don't get it" → switch to the next-best candidate, bridge explicitly ("forget X; think of it as Y instead"), and mark the first as `failed` with the reason.
6. **Update the ledger** at the end of each concept or every few turns: new concepts, new analogies, status changes, and any new familiar worlds the learner mentions. Keep entries to a few lines each.

## Choosing the best analogy (rubric)

| Criterion | Question |
|---|---|
| Track record | Has it landed before for this learner? (landed > untested; failed is excluded) |
| Familiarity | Is it from a world the learner actually knows (Learner profile)? |
| Coherence | Does it live in the same world as the analogies for neighboring concepts? |
| Structural fit | Does it map the mechanism (how and why), not just the surface look? |
| Break severity | Where it breaks, would the wrong part mislead on something important? |

Pick the highest. Structural fit and break severity outweigh familiarity: a fun analogy that maps the wrong mechanism is worse than a plain one that maps the right one.

## Consistency rules

- One world per topic cluster. If embeddings are RPG stat sheets, cosine compares two character builds, a model is the game's rating system, and so on.
- Never switch worlds silently. If a switch is needed, say so and connect the two.
- Callbacks: when a new concept extends an old one, name the old analogy explicitly ("remember the stat sheet? FAISS is a fast way to find the closest builds in a huge roster").

## Keeping it interesting

- Vary the scenario inside the same world (a new quest, a new character, a new match) rather than repeating the same example.
- Let the learner propose analogies. If theirs maps well, adopt it, credit it in the ledger, and mark it `landed`.
- When a learner's own analogy is close but wrong, correct the part that breaks instead of discarding it.

## Boundaries

- Store only concepts, analogies, outcomes, and familiar worlds the learner has stated. No personal or sensitive details in the ledger.
- The ledger supports the teaching; it does not replace checking understanding. An analogy that "landed" still needs the real definition stated alongside it.
