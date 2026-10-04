---
name: learning-ledger
description: Use when teaching or explaining a concept: adapts to how this learner learns, picks the best analogy from their stored ledger, builds on past ones, and records what landed or failed.
---

# Learning Ledger

Help every learner learn efficiently, at their own pace, in their own way. It adapts to evidence of what actually works for this person, never to a fixed "learning style" label.

A universal learning approach for any learner and any subject. Every concept a learner studies gets one or more analogies stored in a ledger, along with whether each one landed or failed. New concepts are explained by extending analogies that already worked, so understanding builds on itself instead of restarting each time. The ledger also records how this learner learns best, and the approach adapts turn by turn as the conversation goes on.

## Where the ledger lives

- Primary: Claude's memory, in a file named `learning/analogy-ledger.md` (inside whatever folder the memory system requires for this session or project).
- Fallback: a local file `analogy-ledger.md` in the learner's working folder or repo.
- No persistence available: keep the ledger in the conversation itself and offer to export it as a file at the end.
- Read the ledger before explaining anything. If none exists, start one (see "First session with a new learner").

## Ledger format

```markdown
# Analogy ledger

## Learner profile
- Familiar worlds: (hobbies, games, sports, jobs, shows the learner has mentioned)
- What works: (e.g. visuals, tables, worked numbers, code right away, short steps)
- What doesn't: (e.g. long prose, abstract definitions first)
- Pace: (e.g. one idea at a time; fine with dense explanations)

## Concepts

### <concept> (<subject or course>)
- Related: <neighbor concepts>
- A1: <analogy>. Status: landed | untested | failed. Maps: <analogy part = real part, ...>. Breaks: <where it stops being true>.
- A2: <analogy>. Status: failed. Why: <what the learner misread>. Do not reuse.
- Misconceptions seen: <wrong ideas the learner stated, and the correction>
```

Example entries (any subject works the same way):

```markdown
### embedding (NLP)
- Related: vector, cosine similarity
- A1: RPG stat sheet. Status: landed. Maps: sentence = character, 384 numbers = stats, similar meaning = similar build. Breaks: real stats have no names and are learned, not designed.
- A2: sliders. Status: failed. Why: learner read it as a sliding window. Do not reuse.

### osmosis (biology)
- Related: diffusion, cell membrane
- A1: crowded room with a door only small people fit through. Status: landed. Maps: people = water molecules, door = membrane, crowd thinning out = equalizing concentration. Breaks: molecules don't choose to move; it's random motion.
```

Status values: `landed` (learner restated or applied it correctly), `untested` (used, no clear signal yet), `failed` (caused confusion; record why and never reuse).

## First session with a new learner

1. Don't run a questionnaire. Start teaching right away.
2. Collect familiar worlds from what the learner mentions naturally ("I play Valorant", "I'm into cricket"). If nothing has come up by the first analogy, ask one short question: "What's something you know really well outside this subject?"
3. Until worlds are known, use everyday analogies (kitchens, maps, queues, money) that almost anyone shares.
4. Create the ledger after the first analogy is used.

## Adapting during the conversation

Watch every reply for signals and adjust on the next turn. Record lasting patterns in the Learner profile.

| Signal from the learner | Adjust |
|---|---|
| Restates the idea correctly or applies it to a new case | Mark the analogy `landed`; move on or go one level deeper |
| "Wait", "I don't get it", or a wrong inference traced to the analogy | Switch to the next-best analogy, bridge explicitly ("forget X; think of it as Y instead"), mark the first `failed` with the reason |
| Asks for a visual, diagram or table | Switch to that format for the current concept; note it under "What works" |
| "Slow down", "I'm getting derailed" | Smaller steps, one idea per turn, recap the context before the next question |
| Answers getting shorter, questions skipped, late hour | Check pace; offer to pause and summarize |
| Learner proposes their own analogy | Evaluate it honestly; if it maps well, adopt it and credit it in the ledger |
| Right on the "why" but wrong on the "how" (or the reverse) | Note the pattern; aim the next explanation at the weak side |

## Workflow for every explanation

1. **Read the ledger.** Find the concept, its prerequisites, and its neighbors (`Related` lines).
2. **Reuse before inventing.** A `landed` analogy for this concept or a neighbor is the first choice; extend it to the new detail.
3. **Otherwise generate 2-3 candidates** and pick one with the rubric below.
4. **Explain in this order:**
   - the analogy in one or two sentences;
   - a short mapping (analogy part to real part), as a small table when there are 3+ parts;
   - **where the analogy breaks**, always, in one line (an analogy with no stated limit plants misconceptions);
   - the real definition or mechanism, stated plainly;
   - one check question that makes the learner use the analogy, not just repeat it.
5. **Read the signal** (table above) and adapt.
6. **Update the ledger** at the end of each concept or every few turns: concepts, analogies, statuses, misconceptions, and profile changes. Keep each entry to a few lines.

## Choosing the best analogy (rubric)

| Criterion | Question |
|---|---|
| Track record | Has it landed before for this learner? (landed > untested; failed is excluded) |
| Familiarity | Is it from a world this learner knows (Learner profile)? |
| Coherence | Does it live in the same world as neighboring concepts' analogies? |
| Structural fit | Does it map the mechanism (how and why), not just the surface? |
| Break severity | Where it breaks, would the wrong part mislead on something important? |

Pick the highest. Structural fit and break severity outweigh familiarity: a fun analogy that maps the wrong mechanism is worse than a plain one that maps the right one.

## Consistency rules

- One world per topic cluster. If embeddings are RPG stat sheets, cosine compares two character builds, and so on. Don't jump between unrelated worlds inside one cluster.
- Different subjects may use different worlds; record which world each cluster uses.
- Never switch worlds silently. If a switch is needed, say so and connect the two.
- Callbacks: when a new concept extends an old one, name the old analogy explicitly ("remember the stat sheet? This is the same idea for a whole party").

## Keeping it interesting

- Vary the scenario inside the same world (a new quest, a new match, a new recipe) rather than repeating one example.
- Invite the learner to propose analogies, and credit theirs in the ledger when it works.
- When the learner's own analogy is close but wrong, fix the part that breaks instead of discarding it.

## Review and recall

- When the learner explains topics back, compare against the ledger: say what's right, name what's wrong or missing, and record new misconceptions.
- Offer a simple recall structure when it helps (for example, the same few questions for every topic), and record it in the ledger with a status like any analogy.

## Boundaries

- Store only concepts, analogies, outcomes, misconceptions, familiar worlds and learning preferences the learner has shown or stated. No personal or sensitive details.
- Never infer personality or ability labels; describe what works, not who the learner is.
- Keep the ledger compact: when it grows long, condense older `landed` entries to one line.
- The ledger supports teaching; it doesn't replace checking understanding. An analogy that landed still needs the real definition stated alongside it.