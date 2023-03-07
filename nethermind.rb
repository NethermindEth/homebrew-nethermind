class Nethermind < Formula
  app_version = '1.17.1'
  package_prefix = 'nethermind-1.17.1-120f4c8d'
  desc "Our flagship Ethereum client for Linux, Windows, and macOS—full and actively developed."
  homepage "https://downloads.nethermind.io"
  license "LGPL-3.0-only"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-x64.zip"
    sha256 "afb0caa6728153aae6f459280da8e3d461e9adf847352f96cc0c9333b5dbbfbc"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-arm64.zip"
    sha256 "d21f4160ab0578f394725e1674e85eac4bc1ad821135d170b6f2b149ee985402"
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
