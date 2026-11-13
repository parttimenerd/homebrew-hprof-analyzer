class HprofAnalyzerNightly < Formula
  desc "hprof-analyzer nightly — rolling build from main (MCP server + heap CLI)"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  license "MIT"
  version "2026.11.13"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "f8a53487ba29c2adc622638dcb2e3e35d378df6bcf530645d9916aa3f7f7d556"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1346e30166f625cfce9f152e4dcf943eac8181998a4ca74e782ebcf91a20264"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01c829c185b63418bd2dbbbce9f99f7d0bff8c5cc9aa4334495d7243a2431349"
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
