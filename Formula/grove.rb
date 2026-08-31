class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "0d509ad5fe1f8a7ff028a2b5342dec3a91a068167f1f6b1c9dee4befe1c1a51d"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "49f2990ceb15d86a40ed4f9a29aaf7f2fc14a8ea0aa9378f066e2e181f292dff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "a0ecfd1dee56ce425916b3d360f9c609792dac82a1679b4de2bc92e69ca5375f"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "d3ae2d3ae372964c72ffca3477ea95487a04a5f192ddf9a21ff96c5ad1592134"
    end
  end

  def install
    bin.install "grove"
  end

  def caveats
    <<~EOS
      grove cd and the app's enter-to-go need the shell wrapper.
      Add one line to your shell rc:
        eval "$(grove shell-init zsh)"   # or bash / fish
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
