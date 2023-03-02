class Nethermind < Formula
  desc "Our flagship Ethereum client for Linux, Windows, and macOS — full and actively developed."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.17.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.17.0/nethermind-1.17.0-dd2f2362-macos-x64.zip"
    sha256 "e1b35153f97ab7422f1c40737cae7ebebd49119229bb2716bf1f290daf451765"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.17.0/nethermind-1.17.0-dd2f2362-macos-arm64.zip"
    sha256 "a6939c46a6354e5368a77ef1ec3a665d636df21d46422b592ec4a2ecab9228c8"
  else
    odie "Unexpected platform!"
  end
  
  depends_on "gmp"
  depends_on "snappy"
  depends_on "lz4"
  depends_on "zstd"

  def install
    File.rename("./Nethermind.Runner","./nethermind")
    File.rename("./Nethermind.Cli","./nethermind-cli")
    File.rename("./Nethermind.Launcher","./nethermind-launcher")
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
