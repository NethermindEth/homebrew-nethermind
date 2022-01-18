class Nethermind < Formula
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  url "https://github.com/NethermindEth/nethermind/releases/download/1.12.4/nethermind-darwin-amd64-1.12.4-1c8b669-20220113.zip"
  sha256 "8fbf4ccdb6fe97884bfaa0e1df431e4b11808b564e80d0a9945d2d736b1d4752"
  license "GNU LESSER GENERAL PUBLIC LICENSE"

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
