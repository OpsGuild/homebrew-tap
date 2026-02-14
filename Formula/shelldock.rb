class Shelldock < Formula
  desc "A fast, cross-platform shell command repository manager"
  homepage "https://github.com/OpsGuild/ShellDock"
  url "https://github.com/OpsGuild/ShellDock/archive/v1.3.tar.gz"
  version "1.3"
  sha256 "3d6c72fbd602df87bbc2fe80c55c9ee05657a98d52277cb2197d381e047b8f68"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.3/shelldock-darwin-amd64"
      sha256 "3d6c72fbd602df87bbc2fe80c55c9ee05657a98d52277cb2197d381e047b8f68"
    else
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.3/shelldock-darwin-arm64"
      sha256 "355595e7acea34999bf1e4dbc348bff039bd7b2cf9ef906f7b7c8a2a8d2a78c5"
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
