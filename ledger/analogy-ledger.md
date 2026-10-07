# Analogy ledger

## Learner profile
- Familiar worlds: RPG games, manhwa/anime
- What tends to work: concrete tables, visuals when words don't land, writing code right after a concept, pen and paper for arithmetic

## Concepts

### distributional hypothesis (NLP, Stage 2)
- Related: word vector, embedding
- A1: "a word is known by the company it keeps": a word's vector is a tally of its neighbours. Status: landed. Applied it to build cat/dog/car count vectors. Breaks: real counts need huge, mostly-zero vectors.

### cosine similarity (Stage 2)
- Related: dot product, vector length, embedding
- A1: scalar projection (learner's own link). Status: landed. Maps: dot product divided by lengths = how much one vector lies along the other.
- A2: angle between two arrows. Status: landed. Maps: score = cos(angle); same direction = 1, 90° = 0, opposite = -1. Breaks: real vectors have 384 dimensions, not 2.
- Misconception seen: "slopes". Corrected: slope belongs to one line; cosine compares two arrows.

### embedding (Stage 3)
- Related: distributional hypothesis, cosine similarity, parameters
- A1: RPG stat sheet. Status: landed. Maps: sentence = character, 384 numbers = stats, similar meaning = similar build. Breaks: stats have no names and are learned by the model, not designed.
- A2: sliders. Status: failed. Why: learner read "slider" as a sliding window flagging seen words. Do not reuse.

### model parameters vs embedding output (Stage 3)
- Related: embedding, training
- A1: examiner vs scorecard. Status: untested. Maps: ~22M parameters = examiner's fixed judgment; 384-number vec = one student's scorecard. Breaks: an examiner understands the criteria; the model's criteria are unnamed.

### negative values in an embedding (Stage 3)
- Related: embedding, cosine similarity
- A1: map coordinates: x = -3 is 3 steps west, not "less location". Status: untested. Learner reached "negative = opposite side" on their own just before.

### training an embedding model (Stage 3)
- Related: embedding, gradient descent
- A1: fill-in-the-blank guessing game ("the hero was ___ after dying"): guess, get corrected, nudge, repeat billions of times. Status: landed. Learner restated the loop correctly.

### gradient descent (Stage 3)
- Related: training
- A1: walking downhill in fog: you can't see the bottom, but you can feel which way the ground slopes and step that way. Status: untested.

### mean pooling: sentence vector = average of word vectors (Stage 3)
- Related: embedding, cosine similarity
- A1: party's average build (extends the RPG stat sheet). Status: landed. Maps: word = party member, word vector = member's stat sheet, sentence vector = party average; a tank + mage averages to a build that looks like neither. Breaks: words adjust each other's stats (context) before averaging; party members don't.
- Evidence: learner predicted the mixed synopsis would be diluted. Test: query "revenge story" scored mixed synopsis 0.42, pure-revenge 0.52, pure-romance 0.13.

### Stages 1–3 as one progression (review)
- Related: TF-IDF, cosine similarity, embedding
- A1: four-question grid: for each stage answer Unit, Numbers, Score, Breaks; the Numbers row is what changes, each Breaks box is fixed by the next stage. Status: untested.
- Misconceptions seen in recall: Stage 2 described as synopsis-level (it was word-level); "Stage 2 didn't relate two words" (cosine(cat, dog) did exactly that); Stage 3 as "just more efficient" (it's learned meaning + sentence vectors; efficiency is a side effect).

### what the 384 numbers are (Stage 3, revisited)
- Related: embedding, training, parameters vs embedding output
- A1: each slot is a hidden question the model learned to ask about the text; the number is how strongly the text says "yes". Life cycle: random at the start, shaped by the guessing game, frozen after training, then computed the same way every time (encode is deterministic). Status: untested. Bridged from Stage 2: named neighbour slots with counts became unnamed learned slots with scores.
- Misconceptions seen (6 Oct): "Stage 3 is faster but less accurate" (stated twice; corrected with his own 0.71 result: embeddings were more accurate at meaning); "numbers are whatever the model comes up with when it wants to" (they are deterministic); "Stage 3 calculates numbers with the Stage 2 counting method" (it learns by guessing, not counting; the shared idea is that both learn from context).
- Misconception seen (6 Oct): put "the query" into Stage 2 (Stage 2 is word vs word; no query exists yet). Fixed with a 3-sentence cat/dog/car table; learner computed cosine(cat, dog) = 1/(2*sqrt(2)) instead of 1/2 (length slip: sqrt(2) x sqrt(2) = 2).

### JSON files (tooling)
- Related: Python lists and dicts
- A1: JSON is just Python lists and dicts saved as text; [ ] = list, { } = dict. Status: landed. Learner loaded synopses.json and looped over titles correctly on the first try.

### API vs web scraping (tooling)
- Related: data collection
- A1: restaurant: the API is the waiter taking a GraphQL order form to the kitchen; scraping is copying the menu off the window. Status: untested.

### embeddings vs TF-IDF in practice (Stage 3 checkpoint)
- Related: TF-IDF, embedding, mean pooling, cosine similarity
- A1: own experiment, not an analogy: 6 queries for The Greatest Estate Developer over 50 AniList synopses. Embeddings won on reworded queries ("engineer", "construction worker"); TF-IDF won on exact words and names ("student wakes up inside a fantasy novel", "lloyd"). Status: landed. Learner predicted the no-stemming failure and thought up the "lloyd" test himself.

### ranking search results (Stages 1–3)
- Related: cosine similarity, TF-IDF, embedding, evaluation
- A1: relative grading (learner-proposed, 7 Oct). Status: landed. Maps: raw marks = each synopsis's cosine score (fixed for a query); grade = rank among the other synopses; someone else scoring higher pushes you down (TGED fell to #2 under "construction worker"). Breaks: relative grading always hands out an A even if the whole class failed, and search likewise shows a top 5 even when every score is 0 (TF-IDF on "engineer"). Fix: an absolute threshold ("no good match found").

### Stage 3 self-quiz (7 Oct, written in the notes doc)
- 3 right (count-vector problems; cosine ignores length; dilution as a smaller matching share in long synopses), 3 half, 1 wrong.
- Misconceptions seen: "384 comes from a library we import" (it is the chosen model's output size); 384 vs 22M only half separated (missing: 384 = per-sentence output); "the model decided they're related" (they fit the same blanks and got nudged together); "two texts score 1.0 if they share members with the query" (1.0 = identical vectors, e.g. differ only in capitalisation).
- Pattern holds: intuition right, mechanism words vague. Push precise terms: trained, nudged, output, averaged.
