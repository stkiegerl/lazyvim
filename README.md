# Lazyvim Config

## Installation

### 1. Requirements

- `git` -> for lazyvim
- `libicu`-> for marksman LSP

### 2. Install Lazyvim

```bash
sudo dnf install -y neovim python3-neovim
```

### 3. Make a backup of your current Neovim config

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended

mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

### 4. Install a nerd Font

1. Create a Fonts Directory (if it doesn't exist) and move into it

    ```bash
    mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    ```

1. Visit the [Nerd font](https://www.nerdfonts.com/font-downloads) website, to choose a preferred font and copy the download link. 3. Download the font. (e.g. "JetBrainsMono")

    ```bash
    curl -o JetBrainsMono.zip -L <https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip>
    ```

1. Unzip the downloaded (e.g. `Hack.zip`) and move or copy the directory to `~/.local/share/fonts` directory.

    ```bash
    unzip JetBrainsMono.zip
    ```

1. Delete the original zip file

    ```bash
    rm JetBrainsMono.zip
    ```

1. Refresh Font Cache

    ```bash
    fc-cache -fv
    ```

1. Verify Installation

    ```bash
    fc-list : family style | grep -i JetBrainsMono
    ```

### 5. Clone the git repository

```bash
git clone ...
```
