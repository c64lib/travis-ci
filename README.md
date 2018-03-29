# travis-ci
Put your Commodore 64 assembly language code programs into Travis-CI harness.

# Usage
## Installation
This script currently works only in Linux and other Unix-like operating systems (including Windows with CygWin installed). Concept is very simple: you download `install.sh` script and execute it via sourcing:
```bash
source <(curl -SLs https://raw.githubusercontent.com/c64lib/travis-ci/master/install.sh)
```

After sourcing, assembler should be downloaded and stored in `.cbm` directory. Currently only KickAssembler is supported. There's a shortcut (`ka` command) available for assembling:
```bash
ka vic2.asm
```
will produce `vic2.prg` code out of `asm` file.

>
> Please note that this framework is a proof-of-concept and it's API is a subject for a change. You have been warned!
>

## Dependency management
A *very* simple version of dependency management is currently available. You can use it for downloading assembler libraries from github portal before assembling your project. To download given library you should use `cpm` command using following syntax:
```
cpm <lib name> <url>
```
The `url` should point to `tar.gz` file containing library. It will be depacked into `lib name` subdirectory of `cpm_modules` directory. 

To compile your file you can use `ka` command in following way:
```
ka -libdir cpm_modules <file.asm>
```
This one will automatically include all libraries installed in `cpm_modules` in assembling process. Please note that currently `cpm` command works only under linux (should work with CygWin as well, although I haven't tested it yet).

# Examples
## Installation of framework
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

## Using external libraries via dependency management
In following example we are building `test.asm` file that includes three libraries: `common`, `vic2` and `cia`. This example is real and you can find it in https://github.com/c64lib/test repository.
```
language: asm
sudo: false
before_install:
  - source <(curl -SLs https://raw.githubusercontent.com/c64lib/travis-ci/master/install.sh)
 script:
  - cpm common https://github.com/c64lib/common/archive/0.0.1.tar.gz
  - cpm vic2 https://github.com/c64lib/vic2/archive/0.0.3.tar.gz
  - cpm cia https://github.com/c64lib/cia/archive/0.0.2.tar.gz
  - ka -libdir cpm_modules test.asm
notifications:
email:
    on_success: change
    on_failure: change
```
