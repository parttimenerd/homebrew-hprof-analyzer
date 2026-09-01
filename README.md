# homebrew-hprof-analyzer

Homebrew tap for [hprof-analyzer](https://github.com/parttimenerd/hprof-analyzer) — a fast, low-memory Java HPROF heap-dump analyzer with an MCP server and OQL query engine.

## Install

```sh
brew tap parttimenerd/hprof-analyzer
brew install hprof-analyzer
```

## Usage

Analyze a heap dump:

```sh
hprof-analyzer heap.hprof report.html
```

Interactive OQL queries (no full report needed):

```sh
hprof-analyzer heap query heap.hprof --oql "SELECT COUNT(*) FROM java.lang.String"
```

Start the MCP server for Claude/Cline integration:

```sh
# Add to Claude Code
claude mcp add hprof -- hprof-analyzer mcp

# Or add to Claude Desktop (~/.claude/mcp.json)
# { "hprof": { "command": "hprof-analyzer", "args": ["mcp"] } }
```

See the [main README](https://github.com/parttimenerd/hprof-analyzer#readme) for full documentation.
