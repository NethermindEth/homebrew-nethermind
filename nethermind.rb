class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.38.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.38.1/nethermind-1.38.1-9c365772-macos-x64.zip"
    sha256 "dbd4916f9905c924ddd86da8e853db8c0bdb3ead8b0937e6e5b583c5b1296297"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.38.1/nethermind-1.38.1-9c365772-macos-arm64.zip"
    sha256 "e43502207259e9784e6b914908d0bbe03158982d6c148f2c2c33bb853638ad12"
  else
    odie "Platform not supported"
  end

  def install
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
