class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.31.8"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.8/nethermind-1.31.8-8fca47e8-macos-x64.zip"
    sha256 "89d9bfeca7865f4c8f90dbf5b6d801d1b1e606d93ea41ec2ca27a92008a2b2d5"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.31.8/nethermind-1.31.8-8fca47e8-macos-arm64.zip"
    sha256 "676ef6cb808fc013685c8da8ddeffa7a00d0f5dfeacacf2d2e9e7a9955f1dcc2"
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
