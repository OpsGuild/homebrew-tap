class Shelldock < Formula
  desc "A fast, cross-platform shell command repository manager"
  homepage "https://github.com/OpsGuild/ShellDock"
  url "https://github.com/OpsGuild/ShellDock/archive/v1.4.tar.gz"
  version "1.4"
  sha256 "33eba2c5a2148688202663bf40726cec37c72c0fbfb1ede45f741c15e38ef99f"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.4/shelldock-darwin-amd64"
      sha256 "33eba2c5a2148688202663bf40726cec37c72c0fbfb1ede45f741c15e38ef99f"
    else
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.4/shelldock-darwin-arm64"
      sha256 "7d4ca1a39f7fba4abf54fcc8ff7312a7b4d2f204a1e740ec50ce81cb9abfa8c7"
    end
  end

  def install
    if OS.mac?
      bin.install "shelldock-darwin-#{Hardware::CPU.arch == "arm64" ? "arm64" : "amd64"}" => "shelldock"
    end
  end

  test do
    system "#{bin}/shelldock", "--version"
  end
end
