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
