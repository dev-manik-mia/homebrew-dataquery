# DataQuery for Homebrew

```sh
brew install dev-manik-mia/dataquery/dataquery
```

The full name taps this repository and trusts only the DataQuery cask, as Homebrew 6+ requires
for non-official taps.

DataQuery updates itself (Settings → About → Updates); `brew upgrade --greedy dataquery` also
updates it. The DataQuery release workflow regenerates `Casks/dataquery.rb` with
`scripts/homebrew-cask.sh`, so don't edit it by hand.
