# dev-configs

# Terminal tools
- [lazygit](https://github.com/jesseduffield/lazygit)

# Neovim profile collections
- [my first setup](https://github.com/anhle199/nvim-backup)
- [NvChad](https://github.com/anhle199/NvChad)
- [LazyVim](https://github.com/anhle199/LazyVim)
- [LazyVim-Starter](https://github.com/anhle199/LazyVim-Starter)

# Java - Vim setup
- Coc extenstion: `coc-java`
- Lombok:
  - Download a jar file from [Lombok](https://projectlombok.org/download)
  - Move that file to the `~/.config/coc/extensions/node_modules/coc-java/lombok/` folder and rename it to `lombok-<version>.jar`
  - Enable lombok support in `coc-settings.json`:
    ```json
    "java.jdt.ls.lombokSupport.enabled": true,
    ```
- Semantic highlight:
  ```json
  "[java]": {
    "semanticTokens.enable": true
  }
  ```
