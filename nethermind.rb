class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "2.2.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.2.1/nethermind-2.2.1-c4f1015b-macos-x64.zip"
    sha256 "85e1f2e0d47682c41b3a1d7171e54dc55f1a27072409bf11f39c625f8c6a1ee8"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.2.1/nethermind-2.2.1-c4f1015b-macos-arm64.zip"
    sha256 "061d663ab64e8cbed05440273d8224df49a9f3dd3db0e48e5b7692baf45defca"
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
