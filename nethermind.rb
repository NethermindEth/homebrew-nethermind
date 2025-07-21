class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.32.3"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.3/nethermind-1.32.3-080637ed-macos-x64.zip"
    sha256 "8dae54e8c62f54b0fb6b31021bce435406a93ac2eede0b4a0508191ab6cbd3ff"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.3/nethermind-1.32.3-080637ed-macos-arm64.zip"
    sha256 "03eefe7ccaa3ea2de30b418261896c46a15d2672d0c9473fa0742f296c32fe43"
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
