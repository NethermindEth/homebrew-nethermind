class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.6"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.6/nethermind-1.35.6-9ea7a119-macos-x64.zip"
    sha256 "8acd67407f33a29e0047ddc9f9cbd43225c8aae7f0a84950b7e41210d576fb0a"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.6/nethermind-1.35.6-9ea7a119-macos-arm64.zip"
    sha256 "98105c6ce742832f3e4cfe1615b914e855581a40a60efdf1dc6637e1cea5d017"
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
