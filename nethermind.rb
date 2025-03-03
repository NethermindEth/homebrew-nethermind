class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.31.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.2/nethermind-1.31.2-25e26aaf-macos-x64.zip"
    sha256 "449fdff505e0ff27118f5ccaa5f21809bd3e047066c41268649040e8792ea482"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.2/nethermind-1.31.2-25e26aaf-macos-arm64.zip"
    sha256 "66d680fe448a327273937e2b671c696972262484bcf13e41b79f914580b13d8e"
  else
    odie "Platform not supported"
  end

  def install
    system "codesign -s - ./nethermind"
    system "codesign -s - ./nethermind-cli"
    bin.install Dir['./chainspec']
    bin.install Dir['./configs']
    bin.install Dir['./Data']
    bin.install Dir['./keystore']
    bin.install Dir['./plugins']
    bin.install Dir['./nethermind']
    bin.install Dir['./nethermind-cli']
    bin.install Dir['./NLog.config']
  end

  test do
    system "false"
  end
end
