class Kapp < Formula
  desc "Create Go app running in Kubernetes with minimal configuration"
  homepage "https://github.com/peterj/kapp"
  url "https://github.com/peterj/kapp/archive/0.1.1.tar.gz"
  sha256 "8ab28c1f0e7b0b9b47e9f6e2932aef88469874a221e1bd701b2928bdce7b65bf"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/peterj/kapp"

    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"kapp", "."
    end
  end
end
