class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.33.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.33.1/nethermind-1.33.1-cda59e5b-macos-x64.zip"
    sha256 "1100ad8978b5bf201bfcd4ba42cf1f1562d1f06e73f86641aed7eb67a254cbc0"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.33.1/nethermind-1.33.1-cda59e5b-macos-arm64.zip"
    sha256 "b918f5c546d92d6d67945eb4554056eec4d810d5332bc21b353c49d31eb93436"
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
