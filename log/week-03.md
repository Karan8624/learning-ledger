# Week 3 (18 Oct - 3 Nov 2026)

## 18 Oct: Stage 7 begins
- Mind maps for all six stages made.
- Supervised learning vs using a frozen model; train/test split with stratify (keeps the 65/35 genre ratio in both piles).
- Multi-genre labels: my relational-database idea (manhwa <-> genre link table) is right for storage; for training, "put it in both" = multi-label.
- Built the notebook: genre counts (Love and Life are scraping fragments), my own loop for 18 multi-hot genre columns, Action-only vs Romance-only dataset (578 / 1061).

## 25 Oct - 1 Nov: data, side quests
- Rewrote the OS case study report (19 pages).
- r/manhwa mods approved my query-collection post; it was auto-removed because the account is new, so I asked them to approve it manually. Google Form set up.
- Mined MangaUpdates "I'm Looking For..." threads: 15 real manhwa queries with confirmed answers. Catalogue 53 -> 65 manhwa, test set 17 -> 29 queries. Two AniList matches were wrong and were retired.
- Decision: catalogue stays manhwa-only (I have 2,789 manhwa synopses; manga would need a new dataset).
- Fixed my GitHub profile: README, bio, pinned repos, descriptions.
- Honest review: the project makes sense, but I stalled on Stage 7 for two weeks with side quests. Plan: finish Stage 7, exams 16-30 Nov, then ship the chatbot.

## 2-3 Nov: Stage 7 models
- TF-IDF features: 1,311 x 10,864 (10,766 after cleaning) (rows = synopses, columns = vocabulary).
- Logistic regression 84% vs a 64.6% "always Romance" baseline; Action recall only 0.58. class_weight="balanced" -> 0.89.
- Found publisher credits leaking in (tappytoon, translated); cleaned them out -> 0.90.
- Embeddings 0.92 (my prediction), hybrid 0.93 (a tie). Embeddings are the practical choice.
- Moved the notebook to my nlp venv kernel (registered it with ipykernel; installed pandas there).
- Multi-label with One-vs-Rest over 8 genres: Fantasy F1 0.78 down to Slice of Life 0.24. Next: per-genre thresholds chosen on a dev set.
