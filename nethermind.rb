class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.36.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.36.0/nethermind-1.36.0-31cb81b7-macos-x64.zip"
    sha256 "4459a8278add62b637f2ff82c2c1ad2178c351191fe37e6452687fabd11156f3"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.36.0/nethermind-1.36.0-31cb81b7-macos-arm64.zip"
    sha256 "9e96e54a9c2abaa8182f9081eb46d7d5cd4722c54568af1e0ea7391a4695fb6d"
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
