# Week 2 (12-14 Oct 2026)

## 12 Oct: Stage 5 evaluation
- Built my own test set and eval.py. First ranks 5, 1, 1, 10, 35: Hit@1 40%, Hit@5 60%, MRR 0.47 (computed by hand first, then wrote the code).
- Grew to 14 queries tagged easy / reworded / name / missing. Names were perfect; "easy" lost because so many synopses are novel-transmigration stories.
- Embeddings vs TF-IDF: they fail on different queries. Averaging them (my idea) gave hybrid MRR 0.73.

## 13-14 Oct: hybrid, dev/test, threshold
- 50 more queries as a dev set; my 14 became the test set. Weight chosen on dev (0.3); honest test score MRR 0.70, Hit@5 93%.
- Learned overfitting: picking the weight on the test set flattered the score by 0.03.
- Threshold: the bot can't know MRR live, so use top score and margin. Top < 0.25 and margin < 0.04 caught all wrong answers on dev.
- Idea: fall back to TF-IDF picks when the user says none of the 5 are right.
- Stage 5 done. Notes written.

## 15-17 Oct: Stage 6 begins
- Research: real "find this manhwa" posts are rare to find; only 3 Korean pairs with answers. Added them to the test set (now 17), plus their synopses. Honest test MRR fell 0.70 -> 0.62: real users are harder.
- MCQ checkpoint on Stages 1-5: 14/15, missed softmax again; re-taught with worked examples, now solid.
- Min-max normalised fusion tied the plain hybrid. Bottleneck is data, not maths.
- Enriched synopses with MAL text: helped embeddings, hurt the hybrid because only some entries grew (relative grading / length bias) and the old dev set picked a bad weight.
- Built a realistic dev set (106 queries) following research on how people write these posts. Dev now scores like the human test, and the weight it picks raised honest MRR to 0.69.
