class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.39.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.2/nethermind-1.39.2-65689105-macos-x64.zip"
    sha256 "bba2d2d96cf09adccd5152421efe014b474a2dc7b19fd83993865fa8ec5a76c3"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.2/nethermind-1.39.2-65689105-macos-arm64.zip"
    sha256 "992eef7d6ebbe068845e5c2a724606c7106ec541b3ad7e7b2fba693f9981f974"
  else
    odie "Platform not supported"
  end

  def install
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
