class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "592a52126649987886c8abc0ff0416f409af013b692292ee55d191cfcfdebee4"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "adc974f5a597586bed3884d32a13c3f1c49530bf5f254d12e97168bf97e2337a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "e0ad0a8a10d12d8ca2de198d8c65790b7cc657200656d728163ec962be7a3620"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "3b6d5fe69eb68de2964b7cfe78c56a3ff5ca3a491bccc29fe7cb926863f85e2e"
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
