class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "dbf80700a476ef706f5ca5705b4f098dcf16e182a498781080a4cd51ed92dc60"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "d62d780a705586a854f181fbfee25b7e2359a19963b55de9aba5cdb16435734d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "80586f783a6b9150ece128d16fe7e7dce21f23d8c20e240ba35fef8fcab8b0f1"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "013dc06005828ada12fec3643dbdf4c9cf7aeb73c9f66274737b3de2e94d9625"
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
