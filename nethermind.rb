class Nethermind < Formula
  desc "Our flagship .NET Core Ethereum client for Linux, Windows, MacOs - full and actively developed"
  homepage "http://downloads.nethermind.io"
  url "https://github.com/NethermindEth/nethermind/releases/download/1.10.79/nethermind-darwin-amd64-1.10.79-e45db5f-20210722.zip"
  sha256 "3c68f79533822c93444867df3c4d1cd7b5f98f60359a0c4da542f83d06daed96"
  license "NOASSERTION"

  depends_on "cmake" => :build

  def install
    bin.install './'
  end

  test do
    system "false"
  end
end
