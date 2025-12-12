class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.5"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.5/nethermind-1.35.5-0cc58fc4-macos-x64.zip"
    sha256 "3fad1ccbc56906a766342f5887d06d062166af526faea528dd63e78c13b70c2c"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.5/nethermind-1.35.5-0cc58fc4-macos-arm64.zip"
    sha256 "583fdb5fa874ba16c49b9f5987f30e61d32cc1a112bd3338bd5214ba1561229a"
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
