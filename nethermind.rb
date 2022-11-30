class Nethermind < Formula
  app_version = '1.14.7'
  commit = '4fe81c6'
  date = '20221130'
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  license "GNU LESSER GENERAL PUBLIC LICENSE"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-amd64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "34b30e1e001be08a65f727876ee3980fce5a5bfa53819a288019bc516150684a"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-arm64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "61f9f190a9914d8e39e06aa72b7acc877034ab691a9ae45ea45fba19f78dca86"
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
