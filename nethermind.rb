class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.33.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.33.0/nethermind-1.33.0-e586d620-macos-x64.zip"
    sha256 "e8f332c7108f836a1f6adf1c3a2a5df4b5ae27b49aea6328ebe4776a8b5ad0af"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.33.0/nethermind-1.33.0-e586d620-macos-arm64.zip"
    sha256 "53c236c6e22fb3bb1ef615c66d6852e752908023514595c55a09892466a9b5aa"
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
