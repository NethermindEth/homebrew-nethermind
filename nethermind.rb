class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.37.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.37.1/nethermind-1.37.1-706ad499-macos-x64.zip"
    sha256 "74793f29955845a01e0e9df484a823b16f2df467fd8002afd0a030e3ea242571"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.37.1/nethermind-1.37.1-706ad499-macos-arm64.zip"
    sha256 "2ccfd216d98244244312814b11091bef9590585c04e3b8f2cdacb0a5d45cb09c"
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
