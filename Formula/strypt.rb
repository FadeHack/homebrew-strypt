# Installs the release binary; hashes are the release's SHA256SUMS.
class Strypt < Formula
  desc "Strip hidden identifying metadata from files so they are safer to share"
  homepage "https://github.com/FadeHack/strypt"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.2/strypt-0.1.2-aarch64-apple-darwin"
      sha256 "c16fbc71217d4f45d399a4cac4f74bc0eda018ec4e43c3c540ef9053555f0be9"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.2/strypt-0.1.2-x86_64-apple-darwin"
      sha256 "087fb24d0c5d0cccee096e796f064dcee87f8b6bfd171810cab522c467262fe1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.2/strypt-0.1.2-aarch64-unknown-linux-musl"
      sha256 "6dd8e368462505e47b2cca1e3d35ba5cfa8069be1a25b494ebfa848fd74ee915"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.2/strypt-0.1.2-x86_64-unknown-linux-musl"
      sha256 "8c3d44b4d6199a545d5b09a97990c13ea6222d3ca01b23e76e9da91ac48e0a26"
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
