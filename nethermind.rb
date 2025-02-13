class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.31.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.0/nethermind-1.31.0-a7337ba9-macos-x64.zip"
    sha256 "81ebf36f2b9d61930d09f713bf1dbf364853cec78a4b945f146ab7622791378a"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.0/nethermind-1.31.0-a7337ba9-macos-arm64.zip"
    sha256 "d074639aa1afb1ccee29fab293f636c965fee073a258aaf23745f74037a51cea"
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
