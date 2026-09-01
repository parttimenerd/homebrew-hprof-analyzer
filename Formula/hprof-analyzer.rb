class HprofAnalyzer < Formula
  desc "Fast, low-memory Java HPROF heap-dump analyzer with MCP server and OQL query engine"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/v0.2.0/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_MAC_ARM"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/v0.2.0/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_X86"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/v0.2.0/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM"
    end
  end

  def install
    bin.install "hprof-analyzer"
  end

  def caveats
    <<~EOS
      To use the MCP server with Claude Desktop or Claude Code:

        claude mcp add hprof -- hprof-analyzer mcp

      Or add manually to your MCP config (~/.claude/mcp.json):
        {
          "hprof": {
            "command": "hprof-analyzer",
            "args": ["mcp"]
          }
        }

      See https://github.com/parttimenerd/hprof-analyzer#mcp-server--ai-integration
    EOS
  end

  test do
    system "#{bin}/hprof-analyzer", "--version"
    output = shell_output("#{bin}/hprof-analyzer heap docs --topic syntax")
    assert_match "SELECT", output
  end
end
