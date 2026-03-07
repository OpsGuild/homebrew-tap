class Shelldock < Formula
  desc "A fast, cross-platform shell command repository manager"
  homepage "https://github.com/OpsGuild/ShellDock"
  url "https://github.com/OpsGuild/ShellDock/archive/v1.5.tar.gz"
  version "1.5"
  sha256 "6819042ed78df41964b8dbbe09e2b1879654d0b1cf12207d66694f38baf2b818"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.5/shelldock-darwin-amd64"
      sha256 "6819042ed78df41964b8dbbe09e2b1879654d0b1cf12207d66694f38baf2b818"
    else
      url "https://github.com/OpsGuild/ShellDock/releases/download/v1.5/shelldock-darwin-arm64"
      sha256 "48d050688860ca7f42468d982d4d2249395fd0262c9d85b5dacde146a4a82f50"
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
