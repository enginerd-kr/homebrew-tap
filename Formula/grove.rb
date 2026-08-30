class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "3df1357a3a1a32de2d0f24356b5f723aa0e8eb056a7b7da6731cb940afcadbf1"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "77e9c4c6221bc58b15fbcbc840a53984861fec15f168079a29e09822d0e8afac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "e6ae0d2fe10e6545074878a9c03306afcf9b5be4800889fa005103d5a5ea6dc6"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "707c3cba98dc09bd6541642b716c7d924a173b14d1c7de63ec48c6f5634d7751"
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
