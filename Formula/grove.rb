class Grove < Formula
  desc "Git worktree manager with an interactive terminal UI"
  homepage "https://github.com/enginerd-kr/grove"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-arm64.tar.gz"
      sha256 "2a77412cf6183a4197c7ec2ee0e3b5e24b27ed00444aaba5f0edf3e460c7dc58"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-darwin-x64.tar.gz"
      sha256 "66985f5298dbdab00cf0683c12d36941bfe00a4171baa4c451a36974a8437461"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-arm64.tar.gz"
      sha256 "5b275b72354211cc17467bd44599faea170ec05d50ee12e7a009b40b6fb95313"
    else
      url "https://github.com/enginerd-kr/grove/releases/download/v#{version}/grove-linux-x64.tar.gz"
      sha256 "acb0996040cdf51d9b7c50dbe98384ac0658df50221301900d9fd7f63bbcc2fb"
    end
  end

  def install
    bin.install "grove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grove --version")
  end
end
