class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.32.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.2/nethermind-1.32.2-d3e7eb98-macos-x64.zip"
    sha256 "9ffc0185122cb3a59d9f84316ff4bc8ee68c3eddd1288357eecf31845acb7944"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.2/nethermind-1.32.2-d3e7eb98-macos-arm64.zip"
    sha256 "e4e7254eebd8c30953c7b8d0943b660758bd5b5c33544068a5db566b2e4982ef"
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
