class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.31.7"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.7/nethermind-1.31.7-5767ed47-macos-x64.zip"
    sha256 "9a6fb6ee3fc8106bc5c477cdad1fd07547111d14baaee3fda23f6dd1655b61f2"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.7/nethermind-1.31.7-5767ed47-macos-arm64.zip"
    sha256 "c8a6e7956a3b0b54328156d96bb7cfd99f379e967905a09c2e4ec1853bfff39c"
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
