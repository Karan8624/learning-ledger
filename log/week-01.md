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
