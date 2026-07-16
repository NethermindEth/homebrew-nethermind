class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.39.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.1/nethermind-1.39.1-b7c51322-macos-x64.zip"
    sha256 "96be612469d0983fefd57bae4a6fe0424db5520abb4d3c844e25069e8a065400"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.1/nethermind-1.39.1-b7c51322-macos-arm64.zip"
    sha256 "9d7568dba01ae3672ef8d26ed257ce087e123e3ef9256503aa58567b8542ba1a"
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
