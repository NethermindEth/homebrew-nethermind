class Nethermind < Formula
  desc "A robust execution client for Ethereum node operators."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "2.0.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.0.0/nethermind-2.0.0-bec830cd-macos-x64.zip"
    sha256 "72ce4dbb96f26184043bcdebd6c0b19b54d309ca7347a1572c67d7d6ebc807f0"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/2.0.0/nethermind-2.0.0-bec830cd-macos-arm64.zip"
    sha256 "a63555cc6edc5d203f181a1259ebcc24fc35e90ba0887567602d8a8adc4a1969"
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
