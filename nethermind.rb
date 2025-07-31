class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.32.4"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.4/nethermind-1.32.4-1c4c7c0a-macos-x64.zip"
    sha256 "e8db5f95b7043b3a8a7c98cac3da08cd91d731950ea6600b754c31205067d0da"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.32.4/nethermind-1.32.4-1c4c7c0a-macos-arm64.zip"
    sha256 "a965de9c2c737366f2e27b4e2b4ddf8e760e90dc4c4652c1ff0907701027c64a"
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
