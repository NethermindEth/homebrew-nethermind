class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.39.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.0/nethermind-1.39.0-14aca2c5-macos-x64.zip"
    sha256 "2bf6d56f808bd9e947cf5d7eaf2bdbc4252202a93b0328cbc8f449778954d22a"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.39.0/nethermind-1.39.0-14aca2c5-macos-arm64.zip"
    sha256 "b5504cced338131411655a971309b41bf8b8b2cee48aecdcc0d88ef297f4e46c"
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
