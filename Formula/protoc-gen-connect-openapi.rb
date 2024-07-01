class ProtocGenConnectOpenapi < Formula
  desc "Generate Connect OpenAPI documents from Protocol Buffers"
  homepage "https://github.com/sudorandom/protoc-gen-connect-openapi"
  url "https://github.com/sudorandom/protoc-gen-connect-openapi/archive/refs/tags/v0.8.4.tar.gz"
  sha256 "001d69c5114cfe315f59000316a6f82610b0590c7cd9965eee8abf4981264623"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
    prefix.install_metafiles
  end

  test do
    system "true"
  end
end
