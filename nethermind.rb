class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.3"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.3/nethermind-1.35.3-d9febbce-macos-x64.zip"
    sha256 "c6a4e98707dd48ce997ea0825aad39f9b8544f5706b72f42a242773c70e234cb"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.3/nethermind-1.35.3-d9febbce-macos-arm64.zip"
    sha256 "8012d8aedf56548b702db6c5f4b2ce85f65c9a3a8276d8c287a26c1988e6af29"
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
