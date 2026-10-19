class HprofAnalyzer < Formula
  desc "Fast, low-memory Java HPROF heap-dump analyzer with MCP server and OQL query engine"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/v0.3.2/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "aa73d823596aef75242152e9a24a86b4fbc45fde9f971a01d6f8c75a9a353802"
      version "0.3.2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/v0.3.2/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19c080547ba0d6db16656a4bd0b8a05090bc4ee59802187644b1eeca9907c82f"
      version "0.3.2"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/v0.3.2/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb4b09aef03ee53b44210ebec82e3b1c649bfd2685ce85f115488859553150ae"
      version "0.3.2"
    end
  end

  def install
    bin.install "hprof-analyzer"
  end

  def caveats
    <<~EOS
      Add the MCP server to Claude Code:
        claude mcp add hprof -- hprof-analyzer mcp

      Or add to Claude Desktop (~/.claude/mcp.json):
        { "mcpServers": { "hprof": { "command": "hprof-analyzer", "args": ["mcp"] } } }

      See https://github.com/parttimenerd/hprof-analyzer#mcp-server--ai-integration
    EOS
  end

  test do
    system "#{bin}/hprof-analyzer", "--version"
    assert_match "SELECT", shell_output("#{bin}/hprof-analyzer heap docs --topic syntax")
  end
end
