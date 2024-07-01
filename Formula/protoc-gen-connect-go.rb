class ProtocGenConnectGo < Formula
  desc "Generate Connect Go code from Protocol Buffers"
  homepage "https://connectrpc.com/"
  url "https://github.com/connectrpc/connect-go/archive/refs/tags/v1.16.2.tar.gz"
  sha256 "ad0623ef0d20681fd63eaf284ae96e02b6635b6d76f22974f2d84d7ddba810cc"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/protoc-gen-connect-go"
    prefix.install_metafiles
  end

  test do
    system "true"
  end
end
