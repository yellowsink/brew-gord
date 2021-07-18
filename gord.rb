class Gord < Formula
    desc "Discord TUI client"
    homepage "https://github.com/yellowsink/gord"
    url "https://github.com/yellowsink/gord/archive/2021-07-14.tar.gz"
    version "2021-07-14"
    sha256 "1c1fbbdc753e71fd9b5ccb7f0ba14483decbc0d313e319c1145a871373e3ae02"
    head "https://github.com/yellowsink/gord.git"
  
    depends_on "go" => :build
    depends_on "pngpaste" => :recommended
  
    def install
      ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
      (buildpath/"src/github.com/yellowsink/gord").install buildpath.children
      cd "src/github.com/yellowsink/gord" do
        system "go", "build", "-o", bin/"gord"
        prefix.install_metafiles
      end
    end
  
    test do
      system "true"
    end
  end
  
