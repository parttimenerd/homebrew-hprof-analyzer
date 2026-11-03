class HprofAnalyzerNightly < Formula
  desc "hprof-analyzer nightly — rolling build from main (MCP server + heap CLI)"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  license "MIT"
  version "2026.11.03"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "ed7125670b167406a410a0987d21fe6153503b8ac97edb05a2414590fa0bc781"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "168e7ddb3945d6094b941f2ec678c7c37cdb9f519975e7351178a69157f43d93"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2dbca912422f1eccb071aac09c8cf0af6886c5f6c6800d99bcfa2a0577e6bce"
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
