class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.7"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.7/nethermind-1.35.7-92050c1f-macos-x64.zip"
    sha256 "c14e8b1e4e6a3abfbb58d84aef19d30221f49540242c90083d3b182e4b5aa783"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.7/nethermind-1.35.7-92050c1f-macos-arm64.zip"
    sha256 "49af432a44debc365f628d203d27380d56ee6f111e4d7a2fb63a59164250ae9c"
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
