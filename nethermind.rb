class Nethermind < Formula
  app_version = '1.17.3'
  package_prefix = 'nethermind-1.17.3-671d60ad'
  desc "Our flagship Ethereum client for Linux, Windows, and macOS—full and actively developed."
  homepage "https://downloads.nethermind.io"
  license "LGPL-3.0-only"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-x64.zip"
    sha256 "af3ac11cc8d683c8ece8db8fa1237c827ed9b738cabfa473d22c4c0ae3723e47"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/#{package_prefix}-macos-arm64.zip"
    sha256 "0c44b656a82dcfd985e303070b9de27f5d77e09eff5af42d91ea851f3973b7b9"
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
