class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.34.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.34.1/nethermind-1.34.1-c4238a37-macos-x64.zip"
    sha256 "659c1122fa1c0395957175d5657bda41a073cbe6bfd5628c5503913d974180bc"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.34.1/nethermind-1.34.1-c4238a37-macos-arm64.zip"
    sha256 "0ee1a493fcec5dc0cb458f1316828ceac8a856d5281edb8d6877365b2450cb50"
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
