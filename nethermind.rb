class Nethermind < Formula
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  url "https://github.com/NethermindEth/nethermind/releases/download/1.10.79/nethermind-darwin-amd64-1.10.79-e45db5f-20210722.zip"
  sha256 "e64132e2ee0148c021c50938011225143e7f3de094fcd160715a363218bb8cea"
  license "NOASSERTION"

  depends_on "cmake" => :build

  def install
    bin.install './Nethermind.Runner'
  end

  test do
    system "false"
  end
end
