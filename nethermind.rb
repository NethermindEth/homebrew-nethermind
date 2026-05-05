class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.37.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.37.2/nethermind-1.37.2-8e212be6-macos-x64.zip"
    sha256 "6b688b6b7e8623fecc6c0b31c084a507d756f959428cf290a0a42df6e0dc5372"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.37.2/nethermind-1.37.2-8e212be6-macos-arm64.zip"
    sha256 "d56f72b3c0967fb7b46a2374b5ecd42583fd95260c074c304cf729f20ae2318d"
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
