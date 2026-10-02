class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "2.1.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.1.0/nethermind-2.1.0-b3e7e84c-macos-x64.zip"
    sha256 "7e8beecfd46eb080173f12e9e2c6fa144235b0d7238137c2a14cd35b4792ebfe"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.1.0/nethermind-2.1.0-b3e7e84c-macos-arm64.zip"
    sha256 "e21be972be3fc077fad03233764aa40fdbb2fe2272af0d6ed90131f70b931996"
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
