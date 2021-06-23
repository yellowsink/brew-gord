class Gord < Formula
    desc "Discord TUI client"
    homepage "https://github.com/yellowsink/gord"
    url "https://github.com/yellowsink/gord/archive/2021-06-17.tar.gz"
    version "2021-06-17"
    sha256 "d5f4454912ab19d2966c9460a13de6f8a762bf1a88e188b1d5e1fb9ae4e99152"
    head "https://github.com/yellowsink/gord.git"
  
    depends_on "go" => :build
    depends_on "pngpaste" => :recommended
  
    def install
      ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
      (buildpath/"src/github.com/yellowsink/gord").install buildpath.children
      cd "src/github.com/yellowsink/gord" do
        system "go", "build", "-o", bin/"cordless"
        prefix.install_metafiles
      end
    end
  
    test do
      system "true"
    end
  end
  
