class Shelldock < Formula
  desc "A fast, cross-platform shell command repository manager"
  homepage "https://github.com/OpsGuild/ShellDock"
  url "https://github.com/OpsGuild/ShellDock/archive/v1.1.tar.gz"
  version "1.1"
  sha256 "82c02dc4310cdf1bfc45a7b40abc57d246da641ae8bb357d2e8c2c179c545a1a"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.1/shelldock-darwin-amd64"
      sha256 "82c02dc4310cdf1bfc45a7b40abc57d246da641ae8bb357d2e8c2c179c545a1a"
    else
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.1/shelldock-darwin-arm64"
      sha256 "fbd0d18c4838dc1a0f513e92a7e4ddcab151867c8e52aac0c0172540aef520b2"
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
