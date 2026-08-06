class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.39.3"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.3/nethermind-1.39.3-28cbe2a0-macos-x64.zip"
    sha256 "bfa3334ac754363d30fa46791acb432d844a4fe58eb7fa00f17f4c3c543b5b68"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.3/nethermind-1.39.3-28cbe2a0-macos-arm64.zip"
    sha256 "39b28b68c8493958144adbb6f3c385d47c956f629a1268872db7ed0e157a1a8a"
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
