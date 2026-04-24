class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.37.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.37.0/nethermind-1.37.0-7c0014d6-macos-x64.zip"
    sha256 "323a36044105e940bb6c1b82185cb9a01c4189dc0504d3454260108f5d6b5928"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.37.0/nethermind-1.37.0-7c0014d6-macos-arm64.zip"
    sha256 "ae1dc605bd1a2f05fbebb2e482cf61ed66db07bddd0b7b644a0df6cb6205eb6b"
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
