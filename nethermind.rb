class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.4"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.4/nethermind-1.35.4-5d4dc69d-macos-x64.zip"
    sha256 "cd215d395c4ffb9a104d0996aba37e732ab7c68cc0ecbf1d7356a1ad30e8b4a8"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.4/nethermind-1.35.4-5d4dc69d-macos-arm64.zip"
    sha256 "ee2e51a005bc16b892e9a1b4046ff7cb1a483980d16b012cb4b8c5e26c2c8e97"
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
