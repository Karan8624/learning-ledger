# Analogy ledger

## Learner profile
- Familiar worlds: RPG games, manhwa/anime
- What tends to work: concrete tables, visuals when words don't land, writing code right after a concept, pen and paper for arithmetic, one idea per message for dense mechanism topics, an overview map before zooming in
- What doesn't: several new terms in one message (Stage 4 query/key/value/softmax at once caused overload)
- Pace and patterns: often skips the second half of two-part questions (usually the mechanism part); often studies late at night; asks sharp side questions mid-explanation
- Notebook habits (Stage 7): edits often live only in the editor (unsaved), and cells run out of order; Restart -> Run All plus Ctrl+S is the fix that works
- Design instincts (Stage 8): proposes the architecture himself ("predict the first n probable and then sort through them" = retrieve-then-rerank; "first make the query more feasible" = query rewrite; "look at common keywords among the missed"). Strong at asking what to measure, weaker at the exact mechanics of a limit (assumed the API quota resets like a clock). New project ideas keep arriving mid-stage; the idea rule (rate on the 8-point checklist, then park) is what keeps the stage moving

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

### contextual embeddings: same word, different meaning (Stage 4)
- Related: embedding, attention
- A1: "bank" in "river bank" vs "deposit money at the bank". Status: landed. Learner named river/water and money/deposit as the deciding words.
- Evidence: bank_test.py, token embeddings from the same model: river-bank vs lake-bank 0.893, river-bank vs money-bank 0.800. Shared base = the word's own starting vector (residual); the gap = context.

### attention: how a word decides whom to listen to (Stage 4)
- Related: contextual embeddings, dot product, softmax, mean pooling
- A1: class group project. Query = your question, key = each classmate's badge, softmax = splitting 100 minutes of listening, value = the notes they give you, residual = adding the notes to what you already knew. Status: landed after slowing down to one idea per message.
- A2: LFG (looking-for-group) board. Status: untested (superseded by the classroom).
- A3: memory card game, flipping cards to find a match (learner-proposed). Status: partly landed. Correction: every card is flipped at once and gives a graded score, not a yes/no.
- A4: 2D plot with invented "nature" and "finance" axes: start bank [1,1] pulled to [1.1,4.4] (money) or [4.3,1] (river). Status: untested.
- Misconceptions seen (7-8 Oct): "loop over tokens and encode each alone" (loses context; attention needs the whole text at once); "the attention score is cosine" (it's a dot product, so length counts too); "keys change during attention" (the word's own vector changes; keys are remade only between layers); "softmax is the final step" (softmax is inside every round; mean pooling runs once at the end); "words are compared with the synopses inside encode" (words only talk to words in the same text); confusion between search query and attention query (same name, different things).
- Self-quiz (8 Oct): swapped query and key in the classroom (query = what I am looking for; key = what each classmate advertises). Guessed softmax [1,2,4] gives the top word ~60% (actually 84%: softmax exaggerates gaps). Thought "only weighted values" gives 0 (actually the word becomes a copy of its loudest neighbour; the residual keeps "I am bank"). Landed with the follow-up: without the residual, river-bank copies "river".
- Resolved by the learner (8 Oct, in his words): he thought "bank" from a synopsis was reused for the query "without being taken anew". Every model.encode call starts fresh; nothing carries over between texts except the fixed learned rules.

### softmax (Stage 4)
- Related: attention
- A1: a 100-minute attention budget split by match score, with extra focus on the top scorers. Status: landed. Learner linked it to dilution: giving "the" a fair share would water the meaning down.

### the full encode pipeline (Stages 1-4)
- Related: tokenizing, embedding, attention, mean pooling, cosine similarity
- A1: tokenize → starting vectors → classroom discussion x6 (layers) → mean pooling → one 384-number vector; the query and every synopsis go through the same pipeline separately, then cosine compares the results. Status: landed. Learner's summary: "use the model to make single vectors out of both the query and the synopses, then use cosine to score."

### evaluation: test set, rank, Hit@k (Stage 5)
- Related: ranking, embeddings vs TF-IDF
- A1: final exam with an answer key. Test set = exam questions plus answer key; eval.py = sitting the exam; nothing in the model changes. Status: landed (used it to separate evaluation from training and cross-validation).
- A2: "a friend names a few guesses" for Hit@k. Status: untested.
- A3: k = how many suggestions the chatbot shows the user; a line drawn under position k. Status: partly landed. Learner first read k as "the position where the right answer landed" (that is rank).
- Evidence (12 Oct): 5 learner-written queries, ranks 5, 1, 1, 10, 35. Hit@1 = 2/5 = 40%, Hit@5 = 3/5 = 60%.
- Misconceptions seen: "evaluation is cross-validation / a form of training" (no weights change; cross-validation belongs to training); "Hit@k is the k-th term that was right" (confuses k, a chosen cutoff, with rank); arithmetic slip 2/5 = 20% (pen and paper again).

### side questions (11 Oct)
- "Stage 2 is similar to bagging": name clash. Bag of words (Stage 1, one text as counts) vs bagging (bootstrap aggregating, many models vote, e.g. random forest).
- "The Stage 3 model uses my Stage 2 vectors": no. Same principle (words in similar company get similar vectors), but the model's starting vectors were learned by fill-in-the-blank before download; encode just looks them up.
- Badges (keys) are made per layer by a learned badge-maker, nudged by gradient descent whenever listening to a word helped fill a blank; the link between words emerges, it is never counted.

### MRR, per-type breakdown, hybrid, dev/test, threshold (Stage 5, 12-14 Oct)
- Related: Hit@k, TF-IDF, embeddings, IDF
- MRR: "points by guess number" (1st = 1, 2nd = half, 5th = a fifth). Status: landed; learner computed 0.4658 by hand and wrote the MRR line of code himself.
- Crowded genre = low IDF: "guy ends up inside a novel" describes many synopses, so "easy" queries ranked worse than "reworded". Learner's words: "a lot of novel transmigration slop". Status: landed.
- Hybrid: learner proposed "average them?" himself. Learned that adding a constant never changes a ranking (shift), only multiplying/weights change balance (spread). He first suggested adding constants, then dividing by 50 (= weight 0.02, arbitrary).
- Dev/test split: "a student who sees the exam paper before the exam" / reporting the best of 5 attempts at the same exam. Status: landed. Measured: tuning on test gave MRR 0.73, honest split gave 0.70.
- Learner-proposed fallback: hybrid by default, TF-IDF picks if the user says none are right. Evaluated: would have rescued Latna (hybrid 24, TF-IDF 5).
- Misconceptions seen: "threshold on a query's MRR" (MRR needs the answer key; live bot only has scores, so use top score + margin); "dictionary query: synopsis" (answer is the title); several code-structure slips (overwrote ranks, lines outside the loop, reused a function name for its result, pasted a second loop instead of extending the first).
- Results: test set (14 human queries) hybrid w=0.3 Hit@5 0.93, MRR 0.70 vs emb 0.62, TF-IDF 0.64. Threshold on dev: top < 0.25 and margin < 0.04 catches all 3 wrong #1s.

### Stage 1-5 MCQ checkpoint (16 Oct)
- 14/15 first try. Only miss: softmax share for [1,2,4] (picked 57% = plain division 4/7; correct 84%). Same slip as the 8 Oct quiz (guessed ~60%), so a repeat weakness.
- Re-taught: exp first, then divide; every +1 in score multiplies weight by ~2.7; [0,0,2] -> 79% (worked by hand); [3,3,3] -> 1/3 each. Linked to Stage 5: softmax and rankings only care about gaps between scores (adding a constant changes nothing). Status: landed.

### Stage 6: fusion, data enrichment, realistic dev set (17 Oct)
- Related: hybrid, dev/test split, relative grading, IDF
- Min-max normalisation = "relative grading" applied to each method's scores per query (learner recognised it as min-max scaling from ML; used sklearn MinMaxScaler). Result: tied the plain hybrid (0.62 vs 0.62). Lesson: the dev-tuned weight had already compensated for scale; fusion was not the bottleneck.
- Enriched synopses with MyAnimeList text: 19 of 45 matches were near-copies of the AniList blurb (sites copy the same official text), so only 27 got extra text. Embeddings improved (test Hit@5 0.59 -> 0.76), hybrid got worse.
- Learner's diagnosis of why unchanged entries (Hellper, Summoner) dropped: "relative grading". Correct: half the class got extra study time, so the unchanged ones fell in rank. Lesson: enrich evenly or not at all (length bias; BM25 has a length correction for this).
- Learner's idea: research how humans write "help me find" posts, then generate a realistic synthetic dev set. Evaluated yes, dev only. Research: real queries share ~19-25% of words with the target, describe scenes/objects/looks more than plot, hedge a lot, include wrong details.
- New dev set: 106 queries, mean overlap 0.21, 22% with a deliberate false detail. Dev scores dropped from ~0.96 to ~0.74, close to the human test (~0.69). The realistic dev picked w=0.4, which raised honest test MRR 0.62 -> 0.69 (Hit@10 0.94). Lesson: a dev set must look like the real exam, or tuning on it misleads.
- Real forum queries added to test (GIRL, Hellper, Golden-Haired Summoner): real users are much harder than self-written queries.

### Stage 6 MCQ + re-teach (17 Oct)
- First try 4/10 (5/10 after one misclick). Stage 6 had not settled. Re-taught one at a time:
  - Softmax again (third time): picked 100% for [0,1] (plain division). Rule drilled: exp first, then divide; e^0 = 1 so a 0 score never gets 0%. Check [5,5] and [0,0] -> 50/50 each: correct.
  - MAL copies: checks "same or almost the same text" before adding a source: correct.
  - Hellper drop: weight also changed (0.3 -> 0.1), so two things changed at once; lesson: change one thing at a time (same weight, different data). Learner's first answer "compare the two models" needed precision.
  - Real query overlap ~20% vs benchmarks ~55% (learner mixed them up). Learner over-concluded "don't use TF-IDF"; corrected: hybrid still beats embeddings alone.
  - New dev set raised test MRR via a better weight (learner answered "because of the change in weights": right).
- Pattern: learner rushes multi-step arithmetic and two-number comparisons; slows down and gets them right when asked one question at a time.

### Threshold on the realistic dev set (17 Oct)
- On realistic queries #1 is wrong 37/106 times; margin barely helps, so use top score only.
- Framing that worked: "when the bot sounds confident, how often is it right?" plus the cost asymmetry (doubting a right answer is cheap, a confident wrong answer hurts trust).
- Chosen on dev: top < 0.25 -> unsure (dev: 89% of wrong caught, confident answers right 91%). Test: 5/7 wrong caught, confident right 6/8 = 75%.
- The 2 confident mistakes (Latna, Doom Breaker) are "missing" queries matching another synopsis strongly: a threshold cannot catch those; the learner's fallback idea (TF-IDF picks on "none of these") is the right tool.
- Learner ran both thresholds on test; noted that choosing between them on test would be peeking.

### supervised learning and TF-IDF as features (Stage 7, 18 Oct - 3 Nov)
- Related: TF-IDF, train/test split, logistic regression
- Misconception seen: "TF-IDF scans each query and matches synopses" (that is Stage 2/5 search). Stage 7 has no query; TF-IDF only translates each synopsis into a row of word weights.
- A1: search TF-IDF = the person checking answers; classification TF-IDF = the person turning each essay into a score sheet, and the classifier = the student who studies the score sheets. Status: landed.
- A2: vocabulary = an attendance register with 10,864 names; fit_transform writes the register from train, transform only fills it in for test. Status: landed. Learner's words: "the test synopses need to be tested on the same attendance sheet."
- One-hot vs multi-hot: learner linked genre columns to one-hot himself; refined to multi-hot ("tick all that apply"). Status: landed. Built all 18 is_ columns with his own loop (after fixing a for-else bug that appended only each row's last genre).

### logistic regression, baseline, precision/recall, class weights (Stage 7)
- Related: softmax, threshold
- A1: rubric marking: every word adds or subtracts points; training learns how many points each word deserves; sigmoid = two-class softmax. Status: untested.
- Baseline: always saying "Romance" scores 64.6%; the first model scored 84%.
- A2: fishing net: recall = how many fish in the lake you caught, precision = how much of your net is fish, not boots. Status: untested.
- Results (Action vs Romance, 328 test): plain model Action recall 0.58 (cautious, dumps doubt into Romance); class_weight="balanced" -> recall 0.83, accuracy 0.89. F1 introduced as the strict average that punishes imbalance.
- Weights inspected: learner guessed love/friends/crush and sword/mage/fight; model's top words were love/duke/marriage and world/game/martial/hunter.

### leakage: publisher credits (Stage 7)
- Related: dev/test, shortcuts
- Top words included tappytoon, translated, entertainment, from "(Source: ...)" credit lines in 2,363 of 2,789 synopses.
- A1: "the answer key printed faintly on the back of the exam": a real score that measures the wrong thing, because users never type a publisher name. Status: landed. Learner first proposed "putting weights on them" (corrected: remove them from the input; training sets weights).
- Result: removing credits with a regex gave 0.89 -> 0.90 and the words vanished. My prediction (a dip) was wrong: the credits were mostly noise.

### embeddings vs TF-IDF vs hybrid for classification (Stage 7)
- Related: frozen model, Stage 5 hybrid
- A1: encoding the test set is not peeking: MiniLM is a printed dictionary (made before the exam, frozen); TF-IDF fit is a dictionary written from the exam paper. Status: partly landed. Learner's answer "it's like scaling, and we're not fitting on test" had the right conclusion.
- Results: TF-IDF 0.90, embeddings 0.92 (384 numbers vs 10,766), hybrid 0.93 (about 3 synopses: a tie). Learner's prediction that embeddings would win was right; my guess for TF-IDF was wrong.

### multi-label (Stage 7, in progress)
- Related: one-vs-rest, threshold
- A1: a panel of 8 specialist judges, each only answering "is it my genre?", never talking to each other. Status: landed.
- Misconception seen: "One-vs-Rest is like k-fold or XGBoost". Corrected with a table: k-fold = evaluation splits; XGBoost = a team of trees answering the same question; One-vs-Rest = separate models answering different questions.
- Genre choice: learner dropped Unknown, Ecchi, Erotica; missed scraping fragments (Love = merged Boys/Girls Love) and too-rare genres (Sports 21, Gourmet 16). Rule used: keep genres with >= ~100 examples (8 genres).
- Results (embeddings, balanced, 558 test): Fantasy 0.78, Romance 0.73, Action 0.72 ... Slice of Life 0.24. Plot genres do well; tone genres (Comedy, Drama, Slice of Life) struggle because synopses describe what happens, not how it feels. High recall, low precision = trigger-happy detectors.
- Learner's idea: "a percentile score to fix the trigger-happiness" -> per-genre thresholds chosen on a dev set (Stage 6 threshold again); top-k genres noted for later.

### retrieve-then-rerank and the ceiling (Stage 8, 4-8 Nov)
- Related: Hit@k, hybrid, LLM reranking, query rewrite
- Learner's own design (his words): "predict the first n probable and then sort through them after". That is retrieve-then-rerank, proposed by him before it had a name. Pipeline built: rewrite (gpt-oss-20b) -> hybrid shortlist of 50 (0.2 embeddings + 0.8 TF-IDF) -> rerank (gpt-oss-120b reads the ORIGINAL query plus 50 synopses, returns 5 numbers).
- Key idea: the ceiling. The share of answers that reach the top 50 caps the whole system, because the reranker can only reorder what it is given. Hit@50 / Hit@100 measure the ceiling.
- A1: librarian fetches 50 books, an expert then reads them and picks the best 5; the expert cannot choose a book that was never fetched. Status: untested (check next stage by asking him to explain why the rewrite step raised the ceiling).
- Final result on the 30 real test queries: search alone Hit@1 0.20 / Hit@5 0.30 / Hit@50 0.47; search + LLM (no rewrite) 0.43 / 0.43; search + rewrite + LLM ceiling 0.57, Hit@1 0.43, Hit@5 0.57. Caveat: one query = 3.3 points, so small gaps are noise.
- Honest-test note: the first test run (no rewrite) and the final (with rewrite) are two configurations; the rewrite was chosen on dev, then the test was run once with it.

### BM25 (Stage 8, 5 Nov)
- Related: TF-IDF, IDF, length normalisation
- Misconception seen: "saturation is basically scaling". Corrected: saturation = diminishing returns (the 10th "dragon" adds less than the 2nd); length normalisation is the separate part that stops long synopses winning by size.
- Result on dev: BM25 Hit@50 0.60 / Hit@100 0.63 vs TF-IDF 0.60 / 0.67. A better-motivated ranker did not raise the ceiling, so it was not adopted. Lesson: a "better" method has to move the number you care about.
- The learner added BM25 to eval_split.py himself (tokenize, BM25Okapi, bm25_scores, report line) after fixing placement and indentation slips.

### query rewrite / HyDE (Stage 8, 5-7 Nov)
- Related: vocabulary mismatch, hybrid, ceiling
- Idea: users describe a half-remembered plot in their own words; synopses use the site's words. Have an LLM write a short synopsis of what the user is describing, and search with that too (hypothetical document embeddings, HyDE).
- Dev ceiling (Hit@50 / Hit@100): original 0.73 / 0.81; rewrite only 0.78 / 0.83; query + rewrite 0.84 / 0.87. Chosen: query + rewrite.
- Risk seen: the rewrite invents details (a "CEO Kwon Jae-ho" nobody wrote). That is why the reranker reads the original query, never the rewrite.
- Learner wrote rewrite_eval.py himself; lost the query inside the prompt once (restored).

### position bias in LLM reranking (Stage 8)
- Related: reranker, fair test
- Hypothesis still open: the reranker may favour synopses shown early. Two cases kept the same rank (Stellar Swordmaster 2 -> 2, After Ten Millennia 3 -> 3). The --shuffle flag tests it; it needs the 120b quota on dev.

### API quotas and engineering lessons (Stage 8, 6-7 Nov)
- Groq free tier: gpt-oss-120b has 200,000 tokens per day, counted over a rolling 24 hours, and hidden reasoning tokens count. Learner asked twice whether it "refreshes every 24 hrs"; corrected: it is a sliding window, not a clock reset, and each model has its own quota. Fix used: 20b with low reasoning for rewrites, a separate cache file, resume from cache.
- Failures handled: 429 daily limit (DailyLimit exception), two getaddrinfo network crashes (runs resumed from cache). Pending: retry on APIConnectionError.
- Traps named: stale cache files (catalogue_emb.npy, results filenames, mixing 120b and 20b rewrites); change one thing at a time; tune on dev, run test once per configuration.
- The 20b edit to MODEL in rerank.py would have changed two variables at once; reverted to 120b and explained.

### reading the 13 misses (Stage 8, 8 Nov)
- 13 of 30 test answers never reach the top 50. Missed queries are long and chatty (about 123 words vs 49 for the found ones), mostly real posts, 10 of 13 contain "remember"; the answers' synopses are not shorter.
- Learner's idea: look at common keywords among the missed. It produced a real finding. Status: hypothesis only (filler words dilute the match). Four zero-token dev experiments proposed: domain stop words, sentence-level scoring, extractive rewrite, longer-query handling.

### software design for shipping (Stage 8, 6 Nov)
- Learner's ideas: load models once at startup; tell the user when the API credit has run out; a history.csv searched first; store query + title + whether the answer was in the top 5 and at what number.
- Refinements: nothing is trained, so "penalties" means tuning pipeline knobs (prompt, k, weights, stop words) from the logged data; use SQLite instead of CSV; cache keyed on query similarity, not exact text; per-user rate limit; graceful degradation to search-only when the quota is gone; 18+ titles stay searchable with a label.
