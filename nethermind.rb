class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.2/nethermind-1.35.2-faa9b9e6-macos-x64.zip"
    sha256 "88f79dab55957f5707c44bf44163a323459511cd177dea0aa08ff5433d3f6193"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.2/nethermind-1.35.2-faa9b9e6-macos-arm64.zip"
    sha256 "c7991b10de19866d41ca2208985439932a1742e5ded01bf7eccb8857ffaf006f"
  else
    odie "Platform not supported"
  end

  def install
    system "codesign -s - ./nethermind"
    bin.install Dir['./chainspec']
    bin.install Dir['./configs']
    bin.install Dir['./Data']
    bin.install Dir['./keystore']
    bin.install Dir['./plugins']
    bin.install Dir['./nethermind']
    bin.install Dir['./NLog.config']
  end

  test do
    system "false"
  end
end
