# Dev Tricks
Some stuff from daily development.

## Java

### Install a jar in your local maven repository
```bash
mvn install:install-file -Dfile=./demo.jar \
    -DgroupId=com.example -DartifactId=demo -Dversion=0.1.0 -Dpackaging=jar
```

### Run Spring Boot application with JVM arguments
```bash
mvn spring-boot:run  -Dspring-boot.run.jvmArguments="-Xms1024m -Xmx512m"
```

### JDK8 support in VSCode
settings.json

```json
//...
"java.home": "/path/to/jdk-11",
"java.configuration.runtimes": [
  {
    "name": "JavaSE-1.8",
    "path": "/path/to/jdk-8",
    "default": true
  },
  {
    "name": "JavaSE-11",
    "path": "/path/to/jdk-11",
  },
]
//...

```

## Rust

### Install Diesel CLI with PostgreSQL and MySQL drivers support
```bash
RUSTFLAGS='-L /usr/local/opt/libpq/lib -L/usr/local/opt/mysql-client/lib' cargo install diesel_cli
```

### To show the stdout in test output
```bash
cargo test -- --nocapture
```

## Web

### Check and upgrade dependencies to the newer versions
```bash
npm install -g npm-check-updates
npm-check-updates -u
npm install
```

## MAC OS

### Install Command Line Tools 
```bash
xcode-select --install
```

### Delete ".DS_Store" files
```bash
find . -name '.DS_Store' -type f  -print -delete
```

### Reset Dock and Launchpad
```bash
defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock
```

### Some keyboard shortcuts in Terminal.app

- [⌃+a] Move the cursor to the start of line
- [⌃+e] Move the cursor to the end of line 
- [⌃+l] Clear screen
- [⌃+u] Clear the line
- [⌃+k] Clear the line that appears after the cursor
- [⌥+←] or [⌥+→] Move the cursor word by word

### Clear the commands history in shells
1. BASH
```shell
history -c
```

2. ZSH
```shell
history -p
```
