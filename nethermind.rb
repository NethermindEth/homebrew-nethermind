class Nethermind < Formula
  app_version = '1.16.1'
  package_prefix = 'nethermind-1.16.1-644fe89f'
  desc "Our flagship Ethereum client for Linux, Windows, and macOS—full and actively developed."
  homepage "https://downloads.nethermind.io"
  license "LGPL-3.0-only"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-x64.zip"
    sha256 "8f6d02f7d6e7b481e9b10631d41d55a425f03d72f86a3a5d0b9ed2b9ed933143"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-arm64.zip"
    sha256 "d13d04b22b86aff89041c480f3a7e838d0475d344737df90388eef1a3ac610c1"
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
