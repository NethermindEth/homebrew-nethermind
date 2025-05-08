class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.31.10"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.10/nethermind-1.31.10-f62cfede-macos-x64.zip"
    sha256 "db0f8ba43de71e20a77522243de50473bcd1ade5d2c0a3294e35720ac20c7d0d"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.10/nethermind-1.31.10-f62cfede-macos-arm64.zip"
    sha256 "0a1cc06ca1e317c98be39703b08fe132185352d6b82550d1729e14b4d59236c2"
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
