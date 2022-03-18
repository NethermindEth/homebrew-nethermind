class Nethermind < Formula
  app_version = "1.12.6"
  commit = "fb2a395"
  date = "20220317"
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  license "GNU LESSER GENERAL PUBLIC LICENSE"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-amd64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "df6555a27218344c53e2094884750b47f347392decefd2c58e4757d0b43bdb92"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-arm64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "1b5a968ca6d5bf2b951f63ea333777fda33b346821655db4476e6e55170a8cec"
  else
    odie "Unexpected platform!"
  end

  def install
    File.rename("./Nethermind.Runner","./nethermind")
    File.rename("./Nethermind.Cli","./nethermind-cli")
    File.rename("./Nethermind.Launcher","./nethermind-launcher")
    system "codesign -s - ./nethermind"
    system "codesign -s - ./nethermind-cli"
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
