class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.36.2"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.36.2/nethermind-1.36.2-f5507dec-macos-x64.zip"
    sha256 "a5d585b1961610f112370c84778e1f4811bf57217ff5ca2db5d146647382e0e4"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.36.2/nethermind-1.36.2-f5507dec-macos-arm64.zip"
    sha256 "fd5263b7629f45cba49b3fc216ac1e969e62b3a9540a85db24129cc8dbb9278a"
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
