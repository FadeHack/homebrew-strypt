# Installs the release binary; hashes are the release's SHA256SUMS.
class Strypt < Formula
  desc "Strip hidden identifying metadata from files so they are safer to share"
  homepage "https://github.com/FadeHack/strypt"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.2.0/strypt-0.2.0-aarch64-apple-darwin"
      sha256 "e24ecfb9c189ba9977b2ca71f5d3655babeadbca07bfca69ff6d2698216ac887"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.2.0/strypt-0.2.0-x86_64-apple-darwin"
      sha256 "f2e2131fb2e688cead8064c661a62b49c549ab4b423e5facedd69e2194327b5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.2.0/strypt-0.2.0-aarch64-unknown-linux-musl"
      sha256 "8174b1469dd2213815c967599160051f1017139bbd28e2e8dcd09d2253daf498"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.2.0/strypt-0.2.0-x86_64-unknown-linux-musl"
      sha256 "219c9ea90c3706afc5ef2d98b8c7a487a297d499858df7a04476800e61b452bb"
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
