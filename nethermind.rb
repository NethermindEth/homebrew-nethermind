class Nethermind < Formula
  desc "Our flagship Ethereum client for Linux, Windows, and macOS — full and actively developed."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.18.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.18.0/nethermind-1.18.0-97e80dda-macos-x64.zip"
    sha256 "a8e9160405c73e793ba2595c2e7b0c479214a08f1d2d2c50ac5e3292a50d5f09"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.18.0/nethermind-1.18.0-97e80dda-macos-arm64.zip"
    sha256 "9d1de605fc1faadda74160b7559871bb9573378df909065016b9b65b6cf04857"
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
