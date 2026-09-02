class HprofAnalyzerNightly < Formula
  desc "hprof-analyzer nightly — rolling build from main (MCP server + heap CLI)"
  homepage "https://github.com/parttimenerd/hprof-analyzer"
  license "MIT"
  version "nightly"

  on_macos do
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-apple-darwin.tar.gz"
      sha256 "e8f4cb172c20d431b7a57db34b746e022bf7cee2f4ad43dad2677484887483bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a5e9931bdf67bfabda31c42194b353d171311a2acf4763c8f9cf80f518056e9"
    end
    on_arm do
      url "https://github.com/parttimenerd/hprof-analyzer/releases/download/nightly/hprof-analyzer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1a32234c5a7f4e6d109f3eba9762b91a13061d1f606a5b6db703364a49c4fe0"
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
