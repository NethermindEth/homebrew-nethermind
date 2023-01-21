class Nethermind < Formula
  app_version = '1.16.0'
  package_prefix = 'nethermind-1.16.0-c7df68c6'
  desc "Our flagship Ethereum client for Linux, Windows, and macOS—full and actively developed."
  homepage "https://downloads.nethermind.io"
  license "LGPL-3.0-only"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-x64.zip"
    sha256 "04cbfbccfb2a108760d1a678c0726d790f9b774f9d9c0ffc6a3a4858bf44d97e"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-arm64.zip"
    sha256 "1348bb09e12600f74466631766b99f38f58eb120a71b14f4fd80ec7fcb720c77"
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
