class Nethermind < Formula
  desc "Our flagship Ethereum client for Linux, Windows, and macOS — full and actively developed."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.19.0"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.19.0/nethermind-1.19.0-19d3be4a-macos-x64.zip"
    sha256 "de4fc3c2a9d8582c72ecc628dac26c322e3f13c0cbc1cb460091b81cfdc4b917"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.19.0/nethermind-1.19.0-19d3be4a-macos-arm64.zip"
    sha256 "be50d3501bac5710eea4dfb4077c8065b110bcdf342f5ecd490482e58c1f592d"
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
