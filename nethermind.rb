class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.21.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.21.0/nethermind-1.21.0-bb9b72c0-macos-x64.zip"
    sha256 "32e451ce1868ba87a41c5c58ed8a6ef92d7543711d3fa8519ae590dff23e8fd9"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.21.0/nethermind-1.21.0-bb9b72c0-macos-arm64.zip"
    sha256 "fc255100efa62d2b1b0e9aefe857aca42fe738a4570aa594866496f6e44d5646"
  else
    odie "Platform not supported"
  end

  def install
    system "codesign -s - ./nethermind"
    system "codesign -s - ./nethermind-cli"
    system "codesign -s - ./nethermind-launcher"
    bin.install Dir['./chainspec']
    bin.install Dir['./configs']
    bin.install Dir['./Data']
    bin.install Dir['./keystore']
    bin.install Dir['./plugins']
    bin.install Dir['./nethermind']
    bin.install Dir['./nethermind-cli']
    bin.install Dir['./nethermind-launcher']
    bin.install Dir['./NLog.config']
  end

  test do
    system "false"
  end
end
