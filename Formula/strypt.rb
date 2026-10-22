# Installs the release binary; hashes are the release's SHA256SUMS.
class Strypt < Formula
  desc "Strip hidden identifying metadata from files so they are safer to share"
  homepage "https://github.com/FadeHack/strypt"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.3.0/strypt-0.3.0-aarch64-apple-darwin"
      sha256 "ed12307fc4ea5ddfb7b8c2458d464fcd0df8a18527eb8b729bcd8d8dfd2937ee"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.3.0/strypt-0.3.0-x86_64-apple-darwin"
      sha256 "b7d250983d83dc61c82c7709d0520cf103e4ef31123bd1598776fc6992948e49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.3.0/strypt-0.3.0-aarch64-unknown-linux-musl"
      sha256 "020fb0711abea816becf5d86293a55d1f520d680ea8f5e6f3855fd7b6b39eb2a"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.3.0/strypt-0.3.0-x86_64-unknown-linux-musl"
      sha256 "fc60ef285d803141ce8e29c1a246d2813a4a9167c54fb53458a59559c8e07d68"
    end
  end

  def install
    bin.install Dir["strypt-#{version}-*"].first => "strypt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/strypt --version")
    (testpath/"t.svg").write '<svg xmlns="http://www.w3.org/2000/svg"><metadata>x</metadata></svg>'
    system bin/"strypt", "strip", testpath/"t.svg"
    refute_match "metadata", (testpath/"t.stripped.svg").read
  end
end
