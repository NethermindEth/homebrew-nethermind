class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "2.2.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.2.0/nethermind-2.2.0-1d2aff00-macos-x64.zip"
    sha256 "4c66c8833add8b803e0d506e996850a54887674a37fea8b21f070e8c940e8b94"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.2.0/nethermind-2.2.0-1d2aff00-macos-arm64.zip"
    sha256 "8249f04ee942758839718d6aaf6aa577e1bb9fddde14ddf415626286e3662f6f"
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
