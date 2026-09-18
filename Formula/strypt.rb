# Installs the release binary; hashes are the release's SHA256SUMS.
class Strypt < Formula
  desc "Strip hidden identifying metadata from files so they are safer to share"
  homepage "https://github.com/FadeHack/strypt"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.1/strypt-0.1.1-aarch64-apple-darwin"
      sha256 "eac114754eb068e90295ef136b13cc0a3b97d0d83129d0132313d6ae09e5662e"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.1/strypt-0.1.1-x86_64-apple-darwin"
      sha256 "42de0d809dabb529e1505ffc22cbb41843ccc21c2b6fb617e27453f368f27957"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.1/strypt-0.1.1-aarch64-unknown-linux-musl"
      sha256 "7f0bb39a55b280d73a534fe5b645095a139cdd3e60403233b17eec95b38ad84a"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.1/strypt-0.1.1-x86_64-unknown-linux-musl"
      sha256 "25c573aa365844d26f2394a9b9cdaeb817d4950a05c60c4271e2583b481b31a0"
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
