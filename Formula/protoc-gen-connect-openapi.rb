class ProtocGenConnectOpenapi < Formula
  desc "Generate Connect OpenAPI documents from Protocol Buffers"
  homepage "https://github.com/sudorandom/protoc-gen-connect-openapi"
  url "https://github.com/sudorandom/protoc-gen-connect-openapi/archive/refs/tags/v0.8.4.tar.gz"
  sha256 "001d69c5114cfe315f59000316a6f82610b0590c7cd9965eee8abf4981264623"
  license "MIT"

  bottle do
    root_url "https://github.com/Xe/homebrew-pkgs/releases/download/protoc-gen-connect-openapi-0.8.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f0ff1521ffe5d9c0da46f78aa3fad04532c491291920222ff8098e2ba9eb5985"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ae21bff36acb35f23c7f0df8c76de3a94997c0e3634c4e8d456bf28a48a3df85"
  end

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
