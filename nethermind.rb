class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.34.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.34.0/nethermind-1.34.0-100632d4-macos-x64.zip"
    sha256 "3d4a959dbf5679315aee2f8bc07d93239777e7972476cd1c5e48fa06d4bb36be"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.34.0/nethermind-1.34.0-100632d4-macos-arm64.zip"
    sha256 "48148a504532069b547761efb567220178d831ff09ed6eb64d5cdab3d895304b"
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
