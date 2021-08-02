class Nethermind < Formula
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  url "https://github.com/NethermindEth/nethermind/archive/refs/tags/1.10.79.tar.gz"
  sha256 "e64132e2ee0148c021c50938011225143e7f3de094fcd160715a363218bb8cea"
  license "NOASSERTION"

  depends_on "cmake" => :build

  def install
    bin.install 'Nethermind.Runner'
  end

  test do
    system "false"
  end
end
