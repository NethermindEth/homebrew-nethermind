class Nethermind < Formula
  app_version = '1.15.0'
  package_prefix = ''
  desc "Our flagship Ethereum client for Linux, Windows, and macOS—full and actively developed."
  homepage "https://downloads.nethermind.io"
  license "LGPL-3.0-only"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-x64.zip"
    sha256 "3e4eb7f817ab10e0c174a5e8be7c888b706b4ce81020cb14cc793872634cb153"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-arm64.zip"
    sha256 "1e8ce2b834cd3d3f9fcfe2b94433cfd415fb52ea1bbea9bac9d3f6607bb4b6e2"
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
