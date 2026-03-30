# claude-small-tools

A collection of small CLI tools powered by [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

All tools use Claude Haiku for fast, cheap responses. Run any tool without arguments for interactive mode.

## Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated

## Install

```bash
git clone https://github.com/paroque28/claude-small-tools.git
cd claude-small-tools
./install.sh
```

This adds `./bin` to your `PATH` (supports bash, zsh, and csh/tcsh). Restart your shell or run:

```bash
source ~/.zshrc  # or ~/.bashrc
```

## Tools

### Translation

#### `tradcat` — Translate to Catalan + IPA

```bash
$ tradcat "Hello, how are you?"
Hola, com estàs?
/ˈɔlə kɔm əsˈtas/

$ tradcat "Ich liebe Programmierung"
M'encanta la programació
[mənˈkantə lə pɾoɡɾəməˈsio]
```

#### `tradde` — Translate to German + IPA

```bash
$ tradde "I love programming"
Ich liebe Programmieren
[ɪç ˈliːbə pʁoɡʁaˈmiːʁən]
```

#### `tradnl` — Translate to Dutch + IPA

```bash
$ tradnl "I love programming"
Ik hou van programmeren
/ɪk ɦɑu vɑn ˌproːɡraːməˈreːrən/
```

### Language

#### `ipa` — IPA transcription (any language)

```bash
$ ipa "Buenos días"
[ˈbwe.nos ˈdi.as]
```

#### `corrcat` — Catalan spell/grammar check

```bash
$ corrcat "Ahir vaig anar al cine amb els meus amigs"
Ahir vaig anar al cine amb els meus amics

- Canviat "amigs" a "amics" (ortografia correcta del plural de amic)
```

#### `explain` — Word etymology and usage

```bash
$ explain "serendipity"
The occurrence of events by chance in a happy or beneficial way.

Coined by Horace Walpole in 1754, from the Persian fairy tale "The Three Princes of Serendip."

I found my favorite coffee shop by pure serendipity when I got lost exploring a new neighborhood.
```

### Dev utilities

#### `whaterror` — Explain error messages

```bash
$ whaterror "ECONNREFUSED 127.0.0.1:5432"
Connection to PostgreSQL on localhost:5432 was refused. No service is listening on that port.

Most likely cause: PostgreSQL is not running.

Fix: sudo systemctl start postgresql
```

#### `gitsum` — Summarize git history

```bash
$ gitsum        # last 10 commits
$ gitsum 5      # last 5 commits
```

#### `namer` — Suggest variable/function names

```bash
$ namer "a function that retries an HTTP request with exponential backoff"
retryWithExponentialBackoff / retry_with_exponential_backoff / retry-with-exponential-backoff
retryHttpRequest / retry_http_request / retry-http-request
...
```

#### `regexfor` — Generate regex from description

```bash
$ regexfor "an email address"
^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$

Matches: user@example.com, john.doe@company.co.uk
Non-match: user@example
```

#### `coderev` — Quick code review

```bash
$ coderev main.py
$ cat script.sh | coderev
```

#### `jsonfix` — Fix malformed JSON

```bash
$ jsonfix '{"name": "test", "items": [1, 2, 3'
{
  "name": "test",
  "items": [1, 2, 3]
}
```

### Shell helpers

#### `howto` — Get shell commands for a task

```bash
$ howto "find all files larger than 100MB"
find . -type f -size +100M
```

#### `explaincmd` — Explain a shell command

```bash
$ explaincmd "tar -xzvf archive.tar.gz -C /opt"
-x: extract files
-z: decompress using gzip
-v: verbose output
-f: read from file (archive.tar.gz)
-C /opt: extract into /opt/
```

### Writing

#### `tldr` — Summarize text

```bash
$ tldr "Machine learning is a subset of AI..."
- ML is a subset of AI focused on systems that learn from data
- Uses algorithms to parse data and make predictions autonomously
```

#### `rewrite` — Rewrite text in a given tone

```bash
$ rewrite --tone formal "hey can u fix the bug in the login page its broken lol"
I would appreciate it if you could address the bug on the login page. It is currently not functioning properly.
```

## Interactive mode

Run any tool without arguments to enter interactive mode:

```bash
$ tradcat
Enter text (press Enter to submit):
hello world
Processing...
hola món
[ˈɔlə ˈmɔn]
```

## License

MIT
