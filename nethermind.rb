class Nethermind < Formula
  app_version = '1.14.6'
  commit = '6aea772'
  date = '20221121'
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  license "GNU LESSER GENERAL PUBLIC LICENSE"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-amd64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "d3803886b30cd152915d18d79fda3cf2d31ca077e8ea0a38837d4777875c9b79"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-arm64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "df775052d967d4296d72b0f85f3179370353abf335942b49e8daed125465eac3"
  else
    odie "Unexpected platform!"
  end

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
