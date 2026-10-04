# Commits and pushes the ledger. Uses the message Claude left in .commit-msg, if any.
Set-Location $PSScriptRoot
$msg = "Update ledger"
if (Test-Path .commit-msg) { $msg = (Get-Content .commit-msg -Raw).Trim() }
git add .
git commit -m "$msg"
git push
if (Test-Path .commit-msg) { Remove-Item .commit-msg }
