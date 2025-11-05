class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.35.1"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.1/nethermind-1.35.1-58f06cd0-macos-x64.zip"
    sha256 "6fbf0cc3819779fa8dc98d577c8cdab966058b3a3980d164f78c7e8d3c8481da"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.35.1/nethermind-1.35.1-58f06cd0-macos-arm64.zip"
    sha256 "75f06f8b0e1b327491d3676bb60b75a014389233a298557aa8d9cd273b69b6aa"
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
