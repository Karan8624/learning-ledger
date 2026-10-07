# Installing Learning Ledger

Works on every Claude plan (Free, Pro, Max, Team, Enterprise). Takes about two minutes.

## 1. Turn on code execution
Go to **Settings → Capabilities** and enable **"Code execution and file creation"**. Skills don't run without it.

## 2. Download the skill
Download [`dist/learning-ledger-skill.zip`](../dist/learning-ledger-skill.zip) from this repo. Don't unzip it.

## 3. Upload it to Claude
Go to **Customize → Skills**, click **+**, choose **Create skill**, then **Upload a skill**, and pick the zip.

Check that `learning-ledger` now shows in your skills list and is switched on.

## 4. Start learning
Open a new chat and try:

> Teach me [a topic you're studying right now]. Use the learning-ledger skill.

Use it for the same subject over several sessions. The ledger only pays off once it has a few concepts to build on.

## Good to know
- **Your ledger is private.** It lives in your own Claude memory. Ask *"show me my analogy ledger"* any time to see it.
- **Memory off?** The skill keeps the ledger inside the chat instead and offers it as a file at the end.
- **Want to update the skill?** Upload the newer zip the same way.

Source: [Use skills in Claude](https://support.claude.com/en/articles/12512180-use-skills-in-claude)
