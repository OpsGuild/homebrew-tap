class Shelldock < Formula
  desc "A fast, cross-platform shell command repository manager"
  homepage "https://github.com/OpsGuild/ShellDock"
  url "https://github.com/OpsGuild/ShellDock/archive/v1.1.tar.gz"
  version "1.1"
  sha256 "67c827f40c5413544920dfdaff1351232f0d73c25a9793ff1a0950af2117aae2"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.1/shelldock-darwin-amd64"
      sha256 "67c827f40c5413544920dfdaff1351232f0d73c25a9793ff1a0950af2117aae2"
    else
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.1/shelldock-darwin-arm64"
      sha256 "e24456f062df622c1d1c9524f8b71c11e3cea8482a94167a158813aff88a46f2"
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
