# Installs the release binary; hashes are the release's SHA256SUMS.
class Strypt < Formula
  desc "Strip hidden identifying metadata from files so they are safer to share"
  homepage "https://github.com/FadeHack/strypt"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.0/strypt-0.1.0-aarch64-apple-darwin"
      sha256 "5a60667493c2333850faa73f88d628abefe30380589fcb38346bef6610ac65d1"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.0/strypt-0.1.0-x86_64-apple-darwin"
      sha256 "95f077f189d7b17b8ff22bfe1cd651b7daa5fac998aad883ecad53d60b717970"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.0/strypt-0.1.0-aarch64-unknown-linux-musl"
      sha256 "7d31e10c306e0fd34505fa101949d674740b13721959f5bd0b03068013fd594f"
    end
    on_intel do
      url "https://github.com/FadeHack/strypt/releases/download/v0.1.0/strypt-0.1.0-x86_64-unknown-linux-musl"
      sha256 "828140cec640056a7b71f7cb0a4854322270794a4d9cd169dc68cf8d2d1ffdcc"
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
