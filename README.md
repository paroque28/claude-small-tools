# claude-small-tools

A collection of small CLI tools powered by [Claude Code](https://docs.anthropic.com/en/docs/claude-code).

## Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated

## Install

```bash
git clone https://github.com/pablorod/claude-small-tools.git
cd claude-small-tools
./install.sh
```

This adds `./bin` to your `PATH`. Restart your shell or run:

```bash
source ~/.zshrc  # or ~/.bashrc
```

## Tools

### `tradcat` — Translate to Catalan + IPA

Translates text from any language to Catalan and outputs the IPA transcription.

```bash
$ tradcat "Hello, how are you?"
Hola, com estàs?
/ˈɔlə kɔm əsˈtas/

$ tradcat "Je suis très content de vous rencontrer"
Estic molt content de conèixer-vos
[əsˈtik ˈmɔɫ kunˈtɛn də kunəˈʃe ˈvɔs]

$ tradcat "Ich liebe Programmierung"
M'encanta la programació
[mənˈkantə lə pɾoɡɾəməˈsio]
```

### `tradde` — Translate to German + IPA

Translates text from any language to German and outputs the IPA transcription.

```bash
$ tradde "I love programming"
Ich liebe Programmieren
[ɪç ˈliːbə pʁoɡʁaˈmiːʁən]

$ tradde "El temps és hermós avui"
Das Wetter ist heute schön
[das ˈvɛtɐ ɪst ˈhɔʏ̯tə ʃøːn]
```

### `tradnl` — Translate to Dutch + IPA

Translates text from any language to Dutch and outputs the IPA transcription.

```bash
$ tradnl "I love programming"
Ik hou van programmeren
/ɪk ɦɑu vɑn ˌproːɡraːməˈreːrən/

$ tradnl "Bonjour, comment allez-vous?"
Goededag, hoe gaat het met u?
[ˈɡuːdədɑx ˌhu ɡɑːt ɦət mət y]
```

## License

MIT
