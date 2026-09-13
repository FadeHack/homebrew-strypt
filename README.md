# homebrew-strypt

Homebrew tap for [strypt](https://github.com/FadeHack/strypt). The formula installs the release
binary for macOS (Apple Silicon, Intel) and Linux (x86_64, aarch64), checked against the release's
`SHA256SUMS`.

```sh
brew install fadehack/strypt/strypt
```

Naming the formula in full is what trusts it: Homebrew 6 refuses a bare `brew tap fadehack/strypt`
until you run `brew trust fadehack/strypt`. Read [`Formula/strypt.rb`](Formula/strypt.rb) first;
it is short.
