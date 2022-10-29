class Nethermind < Formula
  app_version = '1.14.5'
  commit = '380bf9c'
  date = '20221029'
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  license "GNU LESSER GENERAL PUBLIC LICENSE"
  version app_version
  
  case
  when OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-amd64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "6b272bf076007e5ce351329bd052589b05f1cf7a0a5f763f0e9fd8b28b365eb7"
  when OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NethermindEth/nethermind/releases/download/#{app_version}/nethermind-darwin-arm64-#{app_version}-#{commit}-#{date}.zip"
    sha256 "d38a9eb41b7c65dda59a8a64ef418610821e4f137ddfeca2557fefc74440464f"
  else
    odie "Unexpected platform!"
  end

  def install
    File.rename("./Nethermind.Runner","./nethermind")
    File.rename("./Nethermind.Cli","./nethermind-cli")
    File.rename("./Nethermind.Launcher","./nethermind-launcher")
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
