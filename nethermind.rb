class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.22.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.22.0/nethermind-1.22.0-ae444a4b-macos-x64.zip"
    sha256 "0e82251daede4af88a7ee964d77f94ccfbe31264149081d186666938cd234208"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.22.0/nethermind-1.22.0-ae444a4b-macos-arm64.zip"
    sha256 "0e82251daede4af88a7ee964d77f94ccfbe31264149081d186666938cd234208"
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
