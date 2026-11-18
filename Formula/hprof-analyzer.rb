class HprofAnalyzer < Formula
  desc "Fast, low-memory Java HPROF heap-dump analyzer with MCP server and OQL query engine"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  license "MIT"
  version "2026.11.18"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "c0284cfb69cf4eea740155a3df9808e13dd77a12a0c714b42bf12031b2a1b1c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e625981bff15b715b003f8fb13fd7ed9ed505f48bb8428e19a3529b59173660"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9df309d6ab23cbec199b460cb0285f077a51e7150c72593b02dde5fe2d182b23"
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
