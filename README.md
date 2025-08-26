# Homebrew Tap — utilities by @ololx
This is a personal [Homebrew Tap](https://docs.brew.sh/Taps) containing Casks for my macOS utilities.

[![Homebrew Tap](https://img.shields.io/badge/homebrew-tap-informational)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 🚦 Getting Started

### Prerequisites

Before using it, make sure that follows software are installed on the local machine:

- **[Homebrew](https://brew.sh/)** - the package manager.

### Installing

#### 1. Tap the Repository

First, tap this repository using the `brew tap` command. You only need to do this once.

```sh
brew tap ololx/tools
```

#### 2. Install a Cask

Now you can install any Cask from this tap with the standard command.

```sh
brew install --cask <cask name>
```

Examples:

```sh
# install SBC Bitpool Expander
brew install --cask sbc-bitpool-expander

# install Create Symlink
brew install --cask create-symlink
```

### Updating

To update Casks from this tap, use the standard brew upgrade command.

```sh
brew upgrade
```

### Uninstalling

#### Remove Cask

To remove a previously installed Cask, use the standard brew upgrade command.

```sh
brew uninstall --cask <cask name>
```

Examples:

```sh
# remove SBC Bitpool Expander
brew uninstall --cask sbc-bitpool-expander

# remove Create Symlink
brew uninstall --cask create-symlink
```

Some Casks also support zap to remove related configuration files.

```sh
brew zap --cask sbc-bitpool-expander
```

#### Untap

If you no longer want to use this tap at all, you can remove it with:

```sh
brew untap ololx/tools
```

## 🍻 Available Casks

| Cask                 | Description                                                          | Homepage |
|----------------------|----------------------------------------------------------------------|----------|
| sbc-bitpool-expander | Simple app to adjust Bluetooth SBC bitpool value                     | [GitHub](https://github.com/ololx/sbc-bitpool-expander) |
| create-symlink       | Automator Quick Action / Service to create symbolic links via Finder | [GitHub](https://github.com/ololx/create-symlink) |

## 🐞 Reporting Issues

If you encounter a problem, please create an [Issue](https://github.com/ololx/homebrew-tools/issues) in this repository.

Before creating an issue, please run `brew update` and include the output of `brew doctor` and `brew config` in your report.

## ©️ Authors

* **Alexander A. Kropotin** - *Initial work* - [ololx](https://github.com/ololx).

## 🔏 Licensing

This project is licensed under the MIT license - see the [lisence](LICENSE) document for details.
