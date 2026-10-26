class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "2.2.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.2.2/nethermind-2.2.2-be201120-macos-x64.zip"
    sha256 "fb7eb6dae7aeab7f2243d861cdfc3cb101efb8fee98da8b051fa9a5f7c73a18d"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.2.2/nethermind-2.2.2-be201120-macos-arm64.zip"
    sha256 "85ee284870f00a37369e658898f997c4955fa492dcc44477a617d1670b5f00d1"
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
