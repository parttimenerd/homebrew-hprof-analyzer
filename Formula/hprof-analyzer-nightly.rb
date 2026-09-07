class HprofAnalyzerNightly < Formula
  desc "hprof-analyzer nightly — rolling build from main (MCP server + heap CLI)"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  license "MIT"
  version "nightly"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "50f6161e2ad2b6a018c7e385577f274428f854c56999575e8e85364b4b17da3e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56f6d1fb8e091e6d3e6af213ff280dac2a14547548a0859f171d77d0519ce3c6"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c038d83926ddd7485ec3812925e736df1ca2dee2296dbbf6dc14e25f8ec22e3"
    end
  end

  def install
    bin.install "hprof-analyzer"
  end

  def caveats
    <<~EOS
      Add the MCP server to Claude Code:
        claude mcp add hprof -- hprof-analyzer mcp

      See https://github.com/parttimenerd/hprof-analyzer#mcp-server--ai-integration
    EOS
  end

  test do
    system "#{bin}/hprof-analyzer", "--version"
    assert_match "SELECT", shell_output("#{bin}/hprof-analyzer heap docs --topic syntax")
  end
end
