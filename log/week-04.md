# Week 4 (4 Nov - in progress)

## 4-5 Nov: Stage 8 begins
- First honest test of the search + LLM reranker on 30 real queries: Hit@1 0.43 (search alone 0.20).
- Added BM25 to eval_split.py: same Hit@50 as TF-IDF (0.60), so not adopted.
- My design idea: shortlist the likely top n, then sort through them. That became retrieve-then-rerank; first make the query easier for the model (rewrite).

## 6-7 Nov: rewrite step and quota fights
- Wrote rewrite_eval.py. Dev ceiling Hit@50: original 0.73, rewrite 0.78, query + rewrite 0.84.
- Hit the Groq daily token limit at 44 of 109 rewrites; switched rewrites to the 20b model with low reasoning and resumed from the cache.
- Software design talk: load once, show when credit runs out, log feedback in SQLite, cache by similarity, per-user limit.
- Final test with rewrite (run once): ceiling 0.57, Hit@1 0.43, Hit@5 0.57.
- Added real posts from r/manhwa to pending_queries.json; dev set 110, test set stays at 30.

## 8 Nov: wrap-up
- Looked at the 13 misses: long and chatty, 10 of 13 contain "remember". A hypothesis, not a result.
- Stage 8 notes doc written.
- Side ideas rated and parked (Moodle companion 7/10, Bluffbot, others). Replied to the Chipzen invite: exams first, a later season.
- Plan: exams 16-30 Nov; hard stop on the chatbot around 10 Nov; GitHub repo and the one-page app next, public launch after exams.
