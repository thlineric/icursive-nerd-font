## About

This is a guide to patch `iCursive` font.

Before the start, you might want to see the final display effect(read on even if you don't want to do this), this requires terminal emulators that support using different font family in different font face. For example, use font A in normal and bold font face, and use font B in italic font face.

As far as I know, [alacritty](https://github.com/alacritty/alacritty) and [kitty](https://github.com/kovidgoyal/kitty) support this feature.

Say if you want to patch the [agave](https://github.com/agarick/agave) font with dank mono.

First of all, you need to know the font family of the agave font. The `fc-list` command in linux will list all installed font, so you can use this command to get the font family of a specific font.

```sh
fc-list | fzf # use fzf to filter the result
fc-list | grep -i 'agave' # or directly grep
```

Then you get this line:

```
/usr/share/fonts/TTF/agave-r.ttf: Agave:style=Regular
```

The font family is `Agave`.

Now get the font family of dank mono in the same way

```
$ fc-list | grep -i 'dank'

/home/sainnhe/.local/share/fonts/Dank Mono Italic.ttf: Dank Mono:style=Italic
/home/sainnhe/.local/share/fonts/Dank Mono Regular.ttf: Dank Mono:style=Regular
```

So the font family is `Dank Mono`.

Now you can combine them like this(assume you are using alacritty):

```yaml
# in ~/.config/alacritty/alacritty.yml
font:
  # Normal (roman) font face
  normal:
    family: Agave
    style: Regular

  # Bold font face
  bold:
    family: Agave
    style: Bold

  # Italic font face
  italic:
    family: Dank Mono
    style: Italic

  # Point size
  size: 13.0
```

![demo](https://user-images.githubusercontent.com/37491630/76618797-56095600-6521-11ea-81d6-4348514428ed.png)

> color scheme: [gruvbox-material](https://github.com/sainnhe/gruvbox-material) using `mix` palette

## Patch nerd font icons

As you can see, in the screenshot above, the nerd font symbols in the status line look wired. To be precise, this should be called powerline font, because I think this font only patched powerline symbols instead of nerd font symbols. Btw, many fonts only patched powerline symbols, you need to patch nerd font symbols even if some symbols can be displayed.

There is another reason to patch nerd font symbols: some wired symbols can be fixed if it's patched. So it's recommended to patch it.

Edited: I just found this font is already patched in the official repository of [nerd-fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Agave), you can use it directly.

You can follow the official guide to patch it: [Nerd Fonts Patcher](https://github.com/ryanoasis/nerd-fonts#font-patcher)

In short:

```sh
$ git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
$ cd /path/to/nerd-fonts
$ ./font-patcher --mono -w -c -ext ttf /path/to/agave-r.ttf
$ ./font-patcher --mono -w -c -ext ttf /path/to/agave-b.ttf
```

## Add Ligatures

If you want to add ligatures to this font, you can use [ToxicFrog/Ligaturizer](https://github.com/ToxicFrog/Ligaturizer).

Alternatively, for operator mono, you can use [kiliman/operator-mono-lig](https://github.com/kiliman/operator-mono-lig).

This step is optional, but recommended.

## Patch iCursive font

The principle is very simple: rename the fonts to the same font family.

You can use [chrissimpkins/fontname.py](https://github.com/chrissimpkins/fontname.py) to complete this job.

For example:

```shell
git clone --depth 1 https://github.com/chrissimpkins/fontname.py.git
chmod +x ./fontname.py/fontname.py
./fontname.py/fontname.py "Agave iCursive Dk" /path/to/agave-r.ttf
./fontname.py/fontname.py "Agave iCursive Dk" /path/to/agave-b.ttf
./fontname.py/fontname.py "Agave iCursive Dk" /path/to/Dank\ Mono.ttf
```

You may be wondering why I use `S12`, `Op` and `Dk` as a suffix instead of something like `Script12`, `Operator` and `Dank`. This is because windows has a limit on the length of the font family, it cannot exceed 31 characters.

And now, you can use `fc-scan` command(in linux) to check the font family of a ttf file:

```shell
fc-scan -b /path/to/myfont.ttf
```

## The end

If you successfully patched the font, you can follow this [guide](https://wiki.archlinux.org/index.php/Fonts#Manual_installation) to install it.

In short:

```shell
cp /path/to/*.ttf ~/.local/share/fonts/
fc-cache
```

If you are very satisfied with the font you have patched, you can open a PR in this repository to share it with others.

For license reason, if you've patched a non-free font, it's not recommended to upload the binary files directly, but you can write a script to build it instead.
