# Personal Neovim Configuration

## Try out this config

Make sure to remove or move your current `nvim` directory

```
git clone git@github.com:anmac/nvim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE:** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Dependencies

- Ripgrep # for telescope

```
sudo apt install ripgrep
sudo pacman -S ripgrep
```

- Lazygit, NCDU # for toggleterm

```
sudo apt install lazygit
sudo pacman -S lazygit
```

- Nodejs and NPM

```
sudo apt install nodejs npm
sudo pacman -S nodejs npm
```

- Null-ls formatting and diagnostics sources

```
sudo apt install stylua flake8 python-black shfmt shellcheck-bin google-java-format
sudo pacman -S stylua flake8 python-black shfmt shellcheck-bin google-java-format
```

**NOTE:** (You can change/add any source. See details in [null-ls]('https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md']))

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel # for X11
  sudo apt install wl-clipboard # for Wayland
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel # for X11
  sudo pacman -S wl-clipboard # for Wayland
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```

## Fonts

- [A nerd font](https://github.com/ryanoasis/nerd-fonts)

- [codicon](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)
- [An emoji font](https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf)

After moving fonts to `~/.local/share/fonts/`

Run: `$ fc-cache -f -v`

**NOTE:** (If you are seeing boxes without icons, try changing this line from `false` to `true`: [link](https://github.com/ChristianChiarulli/nvim/blob/ac41efa237caf3a498077df19a3f31ca4b35caf3/lua/user/icons.lua#L5))

## Java Debugging and Testing

```
git clone git@github.com:microsoft/java-debug.git
cd java-debug/
./mvnw clean install
```

```
git clone git@github.com:microsoft/vscode-java-test.git
cd vscode-java-test
npm install
npm run build-plugin
```
