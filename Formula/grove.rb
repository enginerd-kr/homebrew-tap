class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "d67a2a6a6de04ba4a13cd50b078309961a2689237c8406791a9852ff7ee78a7d"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "a81782ece474448af887c7f48bd15b7143154e191e617bd131530084c2f1fed9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "1594b22f57a8ffd7233d149c86a4d4e44695f4c0686976944809be22ca75d4bc"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "d0fc265744c0045171fee45e093f21514c072b6956e09c75715454616772f270"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
