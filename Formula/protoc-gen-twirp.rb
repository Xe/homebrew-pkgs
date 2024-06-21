class ProtocGenTwirp < Formula
  desc "Twirp is a simple RPC framework with protobuf service definitions"
  homepage "https://twitchtv.github.io/twirp/docs/intro.html"
  url "https://github.com/twitchtv/twirp/archive/refs/tags/v8.1.3.tar.gz"
  sha256 "ca1c560001a98dfd3b1a7805febfc7735304705b3d32625b5d875485d9a56dca"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Xe/homebrew-pkgs/releases/download/protoc-gen-twirp-8.1.3"
    sha256 cellar: :any_skip_relocation, ventura:      "2ce17ccf6cd012cc1137ca15aab227cbd0cf635da208dbd002673b89a45a621f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0eba65407952501b59b9e65e22aa813af42345ae0609f1fc337f036fd5c0425"
  end

  depends_on "go" => :build
  depends_on "protobuf"

  def install
    ENV["GO111MODULE"] = "auto"
    system "go", "mod", "init", "github.com/twitchtv/twirp"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./protoc-gen-twirp"
    prefix.install_metafiles
  end

  test do
    protofile = testpath/"proto3.proto"
    protofile.write <<~EOS
      syntax = "proto3";
      package proto3;
      option go_package = "package/test";
      message Request {
        string name = 1;
        repeated int64 key = 2;
      }
      service Test {
        rpc Test(Request) returns (Request);
      }
    EOS
    system "protoc", "--twirp_out=.", "--twirp_opt=paths=source_relative", "proto3.proto"
    assert_predicate testpath/"proto3.twirp.go", :exist?
    refute_predicate (testpath/"proto3.twirp.go").size, :zero?
  end
end
