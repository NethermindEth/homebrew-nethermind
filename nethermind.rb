class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.25.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.25.2/nethermind-1.25.2-78c7bf5f-macos-x64.zip"
    sha256 "f13c08f84f4bc7da6d52df80fc9d6b79d9e7c5a571da5f29df23f096fc54e386"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.25.2/nethermind-1.25.2-78c7bf5f-macos-arm64.zip"
    sha256 "8f66c30be31d5ab9b0b941f559ee4745c6f1d290094b10ac2f35d63c7abb09ac"
  else
    odie "Platform not supported"
  end

  def install
    system "codesign -s - ./nethermind"
    system "codesign -s - ./nethermind-cli"
    system "codesign -s - ./nethermind-launcher"
    bin.install Dir['./chainspec']
    bin.install Dir['./configs']
    bin.install Dir['./Data']
    bin.install Dir['./keystore']
    bin.install Dir['./plugins']
    bin.install Dir['./nethermind']
    bin.install Dir['./nethermind-cli']
    bin.install Dir['./nethermind-launcher']
    bin.install Dir['./NLog.config']
  end

  test do
    system "false"
  end
end
