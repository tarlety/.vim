.vim
===
     ____  __   _   ____  _  _  ___
    (_  _)/  ) / ) (_  _)( \( )/ __)
      )(   )( / _ \ _)(_  )  (( (_-.
     (__) (__)\___/(____)(_)\_)\___/'s vim configuration.


<!-- vim-markdown-toc GFM -->

* [What is `.vim`](#what-is-vim)
* [Sensible Configurations](#sensible-configurations)
* [General Key Mappings](#general-key-mappings)
  * [Buffer and Line](#buffer-and-line)
  * [Window](#window)
  * [Tab](#tab)
  * [Edit and Formatting](#edit-and-formatting)
  * [Clipboard](#clipboard)
  * [Misc](#misc)
* [Featuring](#featuring)
  * [File Management (`,nn`)](#file-management-nn)
  * [Marks and Register (`mm`)](#marks-and-register-mm)
  * [Fuzzy Finder (`,ff`)](#fuzzy-finder-ff)
  * [Markdown (`,mm`)](#markdown-mm)
  * [Spell Feature (`,,s`)](#spell-feature-s)
  * [Select then Search (`*`)](#select-then-search-)
  * [Surround Editing (`+` then `S`)](#surround-editing--then-s)
  * [Multiple Selection Editing (`<c-n>`)](#multiple-selection-editing-c-n)
* [Integrated Development Environment](#integrated-development-environment)
  * [How to Navigate Source Code](#how-to-navigate-source-code)
  * [Auto Completion](#auto-completion)
  * [Documentation](#documentation)
  * [Code Comment](#code-comment)
  * [Refactoring](#refactoring)
  * [Compile and Run](#compile-and-run)
  * [CoC List](#coc-list)
* [Plugins](#plugins)
* [Support Languages](#support-languages)
* [Compatibility](#compatibility)
* [License](#license)

<!-- vim-markdown-toc -->

## What is `.vim`

My customized vim configurations, as a sensible and powerful editor environment.

## Sensible Configurations

- Sensible motion, search, fold, and precede of line.
- More file format and encoding supported.
- Persistent editing position and undo history. Auto read when a file is changed from the outside.
- Indent: 4 spaces, expand tabs. Highlight tabs and unwanted spaces.
- Integrate with system clipboard.
- colorscheme: PaperColor Dark.

## General Key Mappings

Common leading key:

- Use `,` as leader key.
- Use `:` or `;` as command key.

Powerful editor key mapping principle:

- Use `,,` as mode changing leading key.
- Use `,f` as find leading key.
- Use `,n` as file management leading key.
- Use `,m` as table mode leading key.
- Use `<c-w>` as window control leading key.
- Use `<c-n>` as multiple selection envoking key.

Powerful IDE key mapping principle:

- Use `=` as auto indent related key.
- Use `,t` as IDE tag list leading key.
- Use `,g` as git leading key.
- Use `,=` as formatting key.
- Use `][` as message navigation leading key.
- Use `<tab>` as IDE coc auto completion.
- Use `<c-o>` as IDE coc code snippets.
- Use `,a` as IDE coc code actions leading key.
- Use `<space>` as IDE coc list leading key.

### Buffer and Line

`g` to move around opened buffers.

| Key             | Action                  |
|-----------------|-------------------------|
| **`gj`**        | Next opened buffer.     |
| **`gk`**        | Last opened buffer.     |
| **`g<tab>`**    | Previous opened buffer. |
| **`g<number>`** | Goto buffer n.          |

`<leader>b` for quick buffer control.

| Key              | Action        |
|------------------|---------------|
| **`<leader>bd`** | Close buffer. |

Other quick cursor and screen control.

| Key     | Action                                |
|---------|---------------------------------------|
| `W` `B` | Faster word and back-word motion.     |
| `z.`    | Put current line to center of screen. |
| `z-`    | Put current line to bottom of screen. |

### Window

`<c-w>` to control window.

| Key                                          | Action                                                        |
|----------------------------------------------|---------------------------------------------------------------|
| **`<c-w>-` `<c-w>`<code>\ or &#124;</code>** | Split window.                                                 |
| **`<c-w>` then `j` or `k` or `h` or `l`**    | Move around in windows.                                       |
| `<c-w>` then `J` or `K` or `H` or `L`        | Move current window to topmost/bottommost/leftmost/rightmost. |
| `<c-w>_`                                     | Maximinze current window.                                     |

Other quick window control.

| Key | Action                                     |
|-----|--------------------------------------------|
| `Q` | Quick close all (or close current window). |
| `q` | Close a quick window.                      |

### Tab

Commands to control tab.

| Key        | Action                |
|------------|-----------------------|
| :tab split | Open new tab.         |
| :tabc      | Close current tab.    |
| :tabn      | Move to next tab.     |
| :tabp      | Move to previous tab. |

### Edit and Formatting

Key '=' for formatting.

| Key                  | Action                                   |
|----------------------|------------------------------------------|
| **`<leader>==`**     | Quick format html, js, json, css, etc... |
| (VISUAL)`<leader>=`  | Advanced coc code formating.             |
| `>` and `<` and `==` | Single line indent.                      |
| (VISUAL)`=`          | Multiple line indent.                    |
| `<leader>=t`         | Expand tabs for buffer or selection.     |

Different edit mode.

| Key                 | Action                       |
|---------------------|------------------------------|
| `<leader><leader>w` | Toggle word wrap on and off. |
| `<leader><leader>p` | Toggle paste mode.           |

### Clipboard

| Key         | Action                   |
|-------------|--------------------------|
| `<leader>u` | Open undo tree.          |
| `<a-p>`     | Cycle back yank history. |

### Misc

| Key               | Action                      |
|-------------------|-----------------------------|
| `zz`              | Save the file.              |
| `<leader>s`       | Open a fancy start screen.  |
| `<leader>rc`      | Open vimrc.                 |
| `<leader>rr`      | Reload vimrc.               |
| `<leader><space>` | Edit next placeholder . |
| `tx`              | Place an AsciiArt.          |

| Command    | Action                                                   |
|------------|----------------------------------------------------------|
| :SudoWrite | Write with sudo, requires ssh-askpass to input password. |

## Featuring

### File Management (`,nn`)

| Key              | Action                          |
|------------------|---------------------------------|
| **`<leader>nn`** | Toggle nerdtree.                |
| **`<leader>nf`** | Open nerdtree in file location. |

### Marks and Register (`mm`)

Marks:

| Key              | Action                  |
|------------------|-------------------------|
| **`mm`**         | Toggle marks.           |
| **`mn` or `mp`** | Next or previous marks. |
| **`m<Space>`**   | Clear marks.            |
| **`ml`**         | List marks.             |

Register:

| Key                | Action                             |
|--------------------|------------------------------------|
| *`"` or `@`*       | Load from register.                |
| (INSERT)`<ctrl-r>` | Load from register in insert mode. |

### Fuzzy Finder (`,ff`)

How to start `Fuzzy Finder` feature:

| Key              | Action                                     |
|------------------|--------------------------------------------|
| **`<leader>fp`** | Fuzzy file finder.                         |
| **`<leader>ff`** | Search for the selected or cursor keyword. |
| `<leader>f*`     | Search for current word.                   |

`Fuzzy Finder` key mappings:

| Key              | Action                              |
|------------------|-------------------------------------|
| **`<leader>f/`** | Open fzf window.                    |
| **`<leader>f;`** | Quick mapping for command history.  |
| **`<leader>fg`** | Git commits for the current buffer. |
| `<leader>fh`     | Search for the opened history.      |
| `<leader>ft`     | Search for global tags.             |
| `<leader>fl`     | Search for the lines.               |
| `<leader>fb`     | Search for opened buffer.           |

### Markdown (`,mm`)

How to enable `Markdown` feature:

| Key              | Action                      |
|------------------|-----------------------------|
| **`<leader>mm`** | Toggle markdown table mode. |

`Markdown` key mappings:

| Key                   | Action                      |
|-----------------------|-----------------------------|
| `<leader>tr`          | Format markdown table mode. |
| `<code>&#124;</code>` | Cell text object.           |

Generate Markdown TOC:

| Command    | Action                                                   |
|------------|----------------------------------------------------------|
| :GenTocGFM | Generate markdown TOC for Github markdown.               |

### Spell Feature (`,,s`)

How to enable `Spell` feature:

| Key                     | Action             |
|-------------------------|--------------------|
| **`<leader><leader>s`** | Toggle spell mode. |

`Spell` key mappings:

| Key              | Action                         |
|------------------|--------------------------------|
| **`<leader>sn`** | Next typo.                     |
| `<leader>sp`     | Previous typo.                 |
| **`<leader>sa`** | Add word to dict.              |
| `<leader>s?`     | Show all suggested correction. |
| **`<leader>sc`** | Apply spell correction         |
| **`<leader>cs`** | List suggested synonym.        |

### Select then Search (`*`)

| Key                          | Action                                        |
|------------------------------|-----------------------------------------------|
| **(VISUAL) then `*` or `#`** | Search for current selection.                 |
| (VISUAL) `<leader>f*`        | Search for current selection in fuzzy finder. |
| **`<leader>/`**              | Disable highlight.                            |

### Surround Editing (`+` then `S`)

| Key                   | Action                                         |
|-----------------------|------------------------------------------------|
| **`+` or `_`**        | Selection expanding or shrinking.              |
| `<c-s>`               | (coc) Language level selection expanding.      |
| **(VISUAL) then `S`** | Surround edit.                                 |
| **`cif` `vic`**       | `f` (function) and `c` (class) as text object. |
| **cs\"\'**            | Replace surround symbol.                       |

### Multiple Selection Editing (`<c-n>`)

| Key                  | Action                                                                                 |
|----------------------|----------------------------------------------------------------------------------------|
| **`<c-n>`**          | Start multi-visual (EXTRA) mode: n confirm and q skip; `[ ]` for selection navigation. |
| *`<c-n>` then `\\a`* | Visual multi selection and align.                                                      |
| `<c-n>` then `\\N`   | Visual multi selection and insert leading number.                                      |

## Integrated Development Environment

### How to Navigate Source Code

Code Navigation (`gd` and moving forward/backward.):

| Key                | Action                          |
|--------------------|---------------------------------|
| **`gd`**           | Go to definition.               |
| **`gf`**           | Open file.                      |
| `gy`               | Go to type definition.          |
| `gi`               | Go to implementation.           |
| `gr`               | Go to references.               |
| **`<c-o>`**        | Jump back to previous location. |
| **`<c-i>, <tab>`** | Jump forward to next location.  |

Use Tagbar:

| Key              | Action         |
|------------------|----------------|
| **`<leader>tt`** | Toggle tagbar. |

Git Navigation:

| Key              | Action              |
|------------------|---------------------|
| **`<leader>gb`** | Open git blame.     |
| **`<leader>gl`** | Open git log.       |
| `<leader>gt`     | Toggle git hunks.   |
| `]c` or `[c`     | Navigate git hunks. |

Warning/Error Navigation:

| Key          | Action                |
|--------------|-----------------------|
| `]e` or `[e` | Navigate lint errors. |
| `]g` or `[g` | Navigate diagnostics. |

### Auto Completion

| Key                 | Action                                                      |
|---------------------|-------------------------------------------------------------|
| **(INSERT)`<tab>`** | Auto completion.                                            |
| **(INSERT)`<c-o>`** | Code Snippets.                                              |

### Documentation

| Key                 | Action                                                      |
|---------------------|-------------------------------------------------------------|
| **`K`**             | Open document.                                              |

### Code Comment

| Key    | Action                          |
|--------|---------------------------------|
| `gcc`  | Toggle comment.                 |
| `gcap` | Toggle comment for a paragraph. |

### Refactoring

| Key                 | Action                                                      |
|---------------------|-------------------------------------------------------------|
| `<leader>a`         | Apply code action, ex: `<leader>aap` for current paragraph. |
| `<leader>ac`        | Apply code action to current buffer.                        |
| `<leader>qf`        | Apply quick fix to the problem of the current line.         |
| `<leader>rn`        | Symbol rename.                                              |

### Compile and Run

| Key                 | Action                                                      |
|---------------------|-------------------------------------------------------------|
| `<leader>R`         | Compile and Run.                                            |
| `<leader>T`         | Open terminal.                                              |

### CoC List

| Key             | Action                                  |
|-----------------|-----------------------------------------|
| `<space>a`      | List CoC diagnostics.                   |
| `<space>e`      | List CoC extensions.                    |
| `<space>c`      | List CoC commands.                      |
| `<space>o`      | List CoC outlines.                      |
| `<space>s`      | List CoC symbols.                       |
| `<space>j or k` | Do default next or previous CoC action. |
| `<space>p`      | Resume previous CoC list.               |

## Plugins

Highlight:

- `vim-plug`: plugin manager.
- `nerdtree` family
    - `nerdtree-git-plugin`
    - `vim-nerdtree-syntax-highlight`
    - `vim-devicons`
- `lightline` family
    - `lightline-buffer`
    - `lightline-hunks`
    - `lightline-ale`
    - `vim-lightline-coc`
- `coc.nvim` extensions
    - `coc-json`
    - `coc-vimlsp`
    - `coc-phpls`
    - `coc-html`
    - `coc-css`
    - `coc-go`
    - `coc-tsserver`
    - `coc-pyright`
- auto completion, syntax highlight, linter checker, snippets
    - `tmux-completion`
    - `ale`
    - `ultisnips` and `vim-snippets`
- markdown family
    - `vim-instant-markdown`
    - `vim-table-mode`
    - `vim-markdown-toc`
- `fzf.vim` and `vim-rooter`

## Support Languages

- `Dockerfile`
- `python`, `go`, `c/c++`, `c#`, `php`, `javascript`, `typescript`
- `json`, `markdown`
- `html`, `css`

## Compatibility

Below vim/neovim versions have been tested:

- NVIM v0.4.3
- Vim 8.1
- Vim 7.4

## License

MIT
