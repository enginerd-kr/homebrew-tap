class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "7d5119e83062e9ff648d60ed8a588c2a8a041d34f9f08bfe748bee7782f39461"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "e40bd003c89f8ffb2fed19e81918ab44d09b1439334062575bb6ae212cfa62dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "1d802eb72902c231b7c226688ba80ae1fbeed19f73187f6e54919a7d1351b2f2"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "9c57dd946f9db13805581422513001aa0dfa95a351360a9c97a92ad89a9599ea"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
