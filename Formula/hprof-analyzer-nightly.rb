class HprofAnalyzerNightly < Formula
  desc "hprof-analyzer nightly — rolling build from main (MCP server + heap CLI)"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  license "MIT"
  version "nightly"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "04b44439ad1562f6b96f886a9958521d15152dad33f36574e0598b5c12e46fce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7f722ef48e423c7da69e884f79349a5dbfeab3bae3bd4aed19c8c919641056b"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8878ac1c929af1d27af74a83bcf1eb789bdc6183c83d4db9e242115a246674eb"
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
