# travis-ci
Put your Commodore 64 assembly language code programs into Travis-CI harness.

# Usage
This script currently works only in Linux and other Unix-like operating systems (including Windows with CygWin installed). Concept is very simple: you download `install.sh` script and execute it via sourcing:
```bash
source <(curl -SLs https://raw.githubusercontent.com/c64lib/travis-ci/master/install.sh)
```

After sourcing, assembler should be downloaded and stored in `.cbm` directory. Currently only KickAssembler is supported. There's a shortcut (`ka` command) available for assembling:
```bash
ka vic2.asm
```
will produce `vic2.prg` code out of `asm` file.

# .travis.yml example
Your travis config file should look similar to the following:
```
language: asm
sudo: false
before_install:
  - source <(curl -SLs https://raw.githubusercontent.com/c64lib/travis-ci/master/install.sh)
script:
  - ka vic2.asm
notifications:
  email:
    on_success: change
    on_failure: change
```
