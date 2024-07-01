class Templ < Formula
  desc "Build HTML with a JSX-like templating language for Go"
  homepage "https://templ.guide/"
  url "https://github.com/a-h/templ/archive/refs/tags/v0.2.731.tar.gz"
  sha256 "229c84a6e48f160d7167131e3fc4a82662a421cb4142f130d1e8d593f81f3595"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "mod", "download"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/templ"
    prefix.install_metafiles
  end

  test do
    (testpath/"input.templ").write <<~EOS
      package test

      templ hello(name string) {
        <div>
          <h1>Hello, { name }</h1>
        </div>
      }
    EOS
    system "#{bin}/templ", "generate"
    assert_predicate testpath/"input_templ.go", :exist?
  end
end
