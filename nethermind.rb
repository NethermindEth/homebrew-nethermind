class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.32.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.1/nethermind-1.32.1-bb80b35f-macos-x64.zip"
    sha256 "0b7db960be6d5ab2d3e8ed07d4f15eec655e2439a982f623fbfd2cb67685c3b9"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.1/nethermind-1.32.1-bb80b35f-macos-arm64.zip"
    sha256 "100aee0d487aeab04523ef7b2cdf712a547867231188ecd4b1296968ab649db8"
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
