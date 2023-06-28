class Nethermind < Formula
  desc "Our flagship Ethereum client for Linux, Windows, and macOS — full and actively developed."
  homepage "https://nethermind.io/nethermind-client"
  license "LGPL-3.0-only"
  version "1.19.3"
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.19.3/nethermind-1.19.3-e8ac1da4-macos-x64.zip"
    sha256 "e0e391870e8646f731074e98bc603950e50c7c789e9e409d94897c90f0ff9ab1"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/1.19.3/nethermind-1.19.3-e8ac1da4-macos-arm64.zip"
    sha256 "98112c419a1b613e693fdac7ae782c39067955138ad04f4b802757ce1e68999e"
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
