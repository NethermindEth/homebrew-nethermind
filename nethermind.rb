class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.38.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.38.0/nethermind-1.38.0-c07a4d65-macos-x64.zip"
    sha256 "8e5922432113c1a80099c8a6875f9ecd1e218b9d51aecc86f106f07f89d0dc69"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.38.0/nethermind-1.38.0-c07a4d65-macos-arm64.zip"
    sha256 "d7c694f127cdf452b5ff0f7614b40b138ab1cb155d52567241d4f250cc800ee4"
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
