# homebrew-strypt

Homebrew tap for [strypt](https://github.com/FadeHack/strypt). The formula installs the release
binary for macOS (Apple Silicon, Intel) and Linux (x86_64, aarch64), checked against the release's
`SHA256SUMS`.

```sh
brew tap fadehack/strypt
brew trust --tap fadehack/strypt
brew install strypt
```

Homebrew 6 asks you to trust a third-party tap before it runs the tap's code. Read
[`Formula/strypt.rb`](Formula/strypt.rb) first: it is short.
