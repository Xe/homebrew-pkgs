class ProtocGenConnectGo < Formula
  desc "Generate Connect Go code from Protocol Buffers"
  homepage "https://connectrpc.com/"
  url "https://github.com/connectrpc/connect-go/archive/refs/tags/v1.16.2.tar.gz"
  sha256 "ad0623ef0d20681fd63eaf284ae96e02b6635b6d76f22974f2d84d7ddba810cc"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Xe/homebrew-pkgs/releases/download/protoc-gen-connect-go-1.16.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e4127ce1a531808f19f4c18a232d3af8461b7e94bcacefb303ad11a461753ddd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5e3119f5e2b46f06e653d7ee012af86318bd186e6273f484182ae182d998a92a"
  end

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
