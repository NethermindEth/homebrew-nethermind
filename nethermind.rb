class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.8"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.8/nethermind-1.35.8-c066aee2-macos-x64.zip"
    sha256 "590c02f5358667abd0ffbe70a0d883b88adf9a0c71108f5a93e476210853763e"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.8/nethermind-1.35.8-c066aee2-macos-arm64.zip"
    sha256 "75db8b6172b4f1e69095e26013a907f4a67c49f1e4ae6889669de1fb4e89dee8"
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
