# Fira Code iCursive S12

![fira-code](https://user-images.githubusercontent.com/37491630/72135806-3d44be80-337f-11ea-998c-85634fac6887.png)

> [`FiraCode`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)(by [tonsky](https://github.com/tonsky), SIL Open Font License) + `Script12 BT`(by Bitstream, free for personal use)

# Fira Code iCursive Op (Non-free)

![fira-op](https://user-images.githubusercontent.com/37491630/72212650-ccfd8080-34d7-11ea-8c38-cbe63a7cb417.png)

> [`FiraCode`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)(by [tonsky](https://github.com/tonsky), SIL Open Font License) + [`Operator Mono`](https://www.typography.com/fonts/operator/styles)(by Hoefler&Co, paid)

# Source Code Pro iCursive S12

![source-code-pro](https://user-images.githubusercontent.com/37491630/72135821-433a9f80-337f-11ea-9b0b-25ca175a00e3.png)

> [`Source Code Pro`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)(by Paul D. Hunt (Adobe), SIL Open Font License) + `Script12 BT`(by Bitstream, free for personal use)

# Source Code Pro iCursive Op (Non-free)

![source-op](https://user-images.githubusercontent.com/37491630/72212652-cff87100-34d7-11ea-8520-1d434bdae8d7.png)

> [`Source Code Pro`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)(by Paul D. Hunt (Adobe), SIL Open Font License) + [`Operator Mono`](https://www.typography.com/fonts/operator/styles)(by Hoefler&Co, paid)

# InconsolataLGC iCursive S12

![InconsolataLGC](https://user-images.githubusercontent.com/37491630/72135813-403faf00-337f-11ea-9ee9-bfffde894bc4.png)

> [`InconsolataLGC`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/InconsolataLGC)(by Raph Levien, SIL Open Font License) + `Script12 BT`(by Bitstream, free for personal use)

# InconsolataLGC iCursive Op (Non-free)

![inconsolata-op](https://user-images.githubusercontent.com/37491630/72212651-ce2ead80-34d7-11ea-803e-5b0a384aa98e.png)

> [`InconsolataLGC`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/InconsolataLGC)(by Raph Levien, SIL Open Font License) + [`Operator Mono`](https://www.typography.com/fonts/operator/styles)(by Hoefler&Co, paid)

# InconsolataGo iCursive Pb (~~vscode~~ incompatible)

![InconsolataGo](https://user-images.githubusercontent.com/37491630/72135810-3e75eb80-337f-11ea-9c15-ed6967d9889b.png)

> [`InconsolataGo`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/InconsolataGo)(by Raph Levien, SIL Open Font License) + [`Playball`](https://fonts.google.com/specimen/Playball)(by Google, SIL Open Font License)

# Roboto Mono iCursive Pt

![roboto-mono](https://user-images.githubusercontent.com/37491630/72135816-4170dc00-337f-11ea-98ff-7ffe3e0b10b3.png)

> [`Roboto Mono`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/RobotoMono)(by Google, Apache License, Version 2.0) + [`Petit Formal Script`](https://fonts.google.com/specimen/Petit+Formal+Script)(by Google, SIL Open Font License)

# Introduction

Many vscode users use fonts like this with some themes that support italics, I want to do the same in vim. I've tried [FiraCodeiScript](https://github.com/kencrocken/FiraCodeiScript), [Operator Mono](https://www.typography.com/fonts/operator/styles) and [Dank Mono](https://dank.sh/) but their support for nerd font symbols is not very good.

Therefore, I decided to patch some fonts myself. All these fonts should support nerd font symbols and be suitable for use in TUI editors like vim.

Some fonts are free of charge, they are patched already and you can directly use the binary files. However, some fonts are not free, so you need to build them by yourself if you want to use them.

# Installation

1. Clone this repository.
2. If you want to install non-free fonts, you need to buy the fonts and build them by yourself.
2. For linux users, follow this [guide](https://wiki.archlinux.org/index.php/Fonts#Manual_installation) to install them.

## Build

### Op series

#### Requirements

1. Binary file of [Operator Mono](https://www.typography.com/fonts/operator/styles)
2. GNU Bash
3. Node.js
4. Python (v2.7+)
5. Python 2 (or Python 3), `python-fontforge` package. See [Nerd Font Patcher](https://github.com/ryanoasis/nerd-fonts/#font-patcher) for details.
6. [`fonttools`](https://github.com/fonttools/fonttools) package. See [Operator Mono Ligatures](https://github.com/kiliman/operator-mono-lig#prerequisites) for details.

#### Steps

1. Clone this repository.
2. `cd /path/to/icursive-nerd-font` and execute `./build.sh Op /absolute/path/to/OperatorMono-BookItalic.otf`

E.g.:

```sh
./build.sh Op /home/sainnhe/Downloads/Operator\ Mono/Operator\ Mono\ Book\ Italic.otf
```

The new font files will be placed in the `*Op` folders.

# FAQ

**Q: What's the color scheme used here?**

**A:** [Gruvbox Material](https://github.com/sainnhe/gruvbox-material)

**Q: What's your status line configuration?**

**A:** Check this [gist](https://gist.github.com/sainnhe/b8240bc047313fd6185bb8052df5a8fb).

# Inspiration

[kencrocken/FiraCodeiScript](https://github.com/kencrocken/FiraCodeiScript)
