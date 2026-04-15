# Homebrew Tap

Personal Homebrew tap for various CLI tools.

## Installation

### Tap this repository

```bash
brew tap nishantapatil3/homebrew-tap
```

## Available Formulas

### dns-switch

Fast, user-friendly TUI for quickly switching between DNS configurations.

```bash
brew install dns-switch
```

[Repository](https://github.com/nishantapatil3/dns-switch)

### port-forward

A lightweight CLI tool for managing SSH port forwarding tunnels.

```bash
brew install port-forward
```

[Repository](https://github.com/nishantapatil3/port-forward)

## Usage

After installing a formula, run the command directly:

```bash
# DNS Switch
sudo dns-switch

# Port Forward
port-forward status
```

## Uninstall

```bash
brew uninstall <formula-name>
brew untap nishantapatil3/homebrew-tap
```

## Development

This tap is automatically updated by GoReleaser when new versions are released.
