# Week 1 (4–10 Oct 2026)

## 4 Oct: Stage 3, embeddings
- Concepts: embeddings, parameters vs outputs, training as a guessing game, gradient descent, cosine as an angle.
- Landed: RPG stat sheet (embeddings), arrows and angles (cosine), fill-in-the-blank game (training).
- Failed: "sliders". Read as a sliding window. Replaced with the stat sheet.
- Result: sentence embeddings scored "reborn after dying" vs "reincarnated after his death" at 0.71, though the sentences share almost no words. TF-IDF would score them near 0.
- Note to self: do arithmetic on paper.

## 4–5 Oct: mean pooling
- Concept: a synopsis vector is the average of its word vectors, so multi-theme synopses get diluted.
- Analogy: party's average build (tank + mage looks like neither). Landed.
- Experiment: "revenge story" vs mixed synopsis 0.42, pure revenge 0.52, pure romance 0.13. A long, rich synopsis can lose to a short single-theme one. Fix later: chunking (Stage 6).

## 5 Oct: recall test, Stages 1–3
- Explained all three stages from memory.
- Pattern: got the "why" right every time (rarity, synonyms, same scoring), missed the "how" (where TF is counted, TF × IDF summed, cosine formula, learned + pooled vectors).
- Next: redo all three using the four-question grid (Unit, Numbers, Score, Breaks), then the Stage 3 checkpoint.

## 5–6 Oct: recall test, round 2
- Stage 1: got TF, IDF, score and breaks; missing only the "where" (TF in the synopsis, IDF across all synopses, sum across query words).
- Stage 2: kept putting "the query" in; fixed with a cat/dog/car counting table. Cosine slip: 1/(2*sqrt(2)) instead of 1/2.
- Stage 3: "faster but less accurate" came back; asked "what are these numbers?". The hidden-questions explanation plus random, trained, frozen helped; final answer linked both stages: they learn from context, one by counting, one by guessing.

## 7 Oct: Stage 3 checkpoint
- Pulled 50 popular manhwa from the AniList GraphQL API into synopses.json. Learned JSON, API vs scraping, list comprehensions, enumerate, input() loops.
- Built search.py (embeddings) and TF-IDF_seach.py, and ran the same queries for The Greatest Estate Developer.
- Results: embeddings won on reworded queries ("engineer": #1 vs all zeros); TF-IDF won on exact wording ("student wakes up inside a fantasy novel": #1 vs not in top 5) and names ("lloyd").
- Conclusion: they fail in different places, so hybrid search next (Stage 6). One good result proves nothing, so evaluate over many queries (Stage 5).
- Twice forgot to save the file before running (Ctrl+S). Turn on Auto Save.
