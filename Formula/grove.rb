class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "14eaaa752e0ded955c3ad4aba026520286e1c3c71c546128d4a68ad9ce36f721"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "b2ff591d1e26d9dcbdfcf35573eace9d35df7cde9b0f331ab05e4f6689650524"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "db312b03eb5d7752d57c5c8e0ed19680fe077687680b271c1093fe3db63afc89"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "b00f3ee0c18a9e6473ec65777ec327452096acbec3d1cd87c763ede6648db34f"
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
