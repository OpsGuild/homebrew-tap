class Shelldock < Formula
  desc "A fast, cross-platform shell command repository manager"
  homepage "https://github.com/OpsGuild/ShellDock"
  url "https://github.com/OpsGuild/ShellDock/archive/v1.2.tar.gz"
  version "1.2"
  sha256 "ce5c26d81cf619e1c4e69ac04d434145a03056e0fa8b87a94d9185df38395155"
  
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.2/shelldock-darwin-amd64"
      sha256 "ce5c26d81cf619e1c4e69ac04d434145a03056e0fa8b87a94d9185df38395155"
    else
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.2/shelldock-darwin-arm64"
      sha256 "c03b4ff11ee815a7f04b4dd71a36c603cf90450fa9257e990fcd0c402e502ca5"
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
