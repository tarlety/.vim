.vim
===
     ____  __   _   ____  _  _  ___
    (_  _)/  ) / ) (_  _)( \( )/ __)
      )(   )( / _ \ _)(_  )  (( (_-.
     (__) (__)\___/(____)(_)\_)\___/'s vim configuration.


<!-- vim-markdown-toc GFM -->

* [Introduction](#introduction)
    * [Core Philosophy](#core-philosophy)
    * [Key Binding Philosophy](#key-binding-philosophy)
* [Improved Experience](#improved-experience)
    * [Improved Editor Experience](#improved-editor-experience)
    * [Improved Visual Experience](#improved-visual-experience)
    * [Improved Coding Experience](#improved-coding-experience)
* [Key Features](#key-features)
    * [Basic Key Binding Rule](#basic-key-binding-rule)
    * [Function Groups](#function-groups)
    * [Mode Changing](#mode-changing)
    * [Navigation Improvement](#navigation-improvement)
    * [Editor Improvement](#editor-improvement)
* [Featuring](#featuring)
    * [Onboarding](#onboarding)
    * [Editor Navigation](#editor-navigation)
    * [Aesthetic Interface](#aesthetic-interface)
    * [IDE](#ide)
* [Theme](#theme)
* [Key Mapping Sheets](#key-mapping-sheets)
    * [Buffer and Line](#buffer-and-line)
    * [Window](#window)
    * [Tab](#tab)
    * [Edit and Formatting](#edit-and-formatting)
    * [Clipboard](#clipboard)
    * [Misc](#misc)
    * [File Management (`,nn`)](#file-management-nn)
    * [Marks and Register (`mm`)](#marks-and-register-mm)
    * [Fuzzy Finder (`,ff`)](#fuzzy-finder-ff)
    * [Markdown (`,m`)](#markdown-m)
    * [Spell Feature (`,,s`)](#spell-feature-s)
    * [Select then Search (`*`)](#select-then-search-)
    * [Surround Editing (`+` then `S`)](#surround-editing--then-s)
    * [Multiple Selection Editing (`<c-n>`)](#multiple-selection-editing-c-n)
    * [How to Navigate Source Code](#how-to-navigate-source-code)
    * [Auto Completion](#auto-completion)
    * [Documentation](#documentation)
* [Support Languages and Filetype](#support-languages-and-filetype)
* [Compatibility](#compatibility)
* [License](#license)

<!-- vim-markdown-toc -->

## Introduction

This .vimrc file integrates personal configurations and plugins to create a practical, comfortable, and powerful editor environment.

By adhering to the core philosophies, this Vim configuration aims to deliver a versatile and enjoyable editing experience tailored to meet the diverse needs of its users.

### Core Philosophy

1. **Intuitiveness**
2. **Simplicity**
3. **Efficiency**
4. **Onboarding**
5. **Visual Aesthetic**
6. **Seamless Integration**

### Key Binding Philosophy

Vim's philosophy emphasizes efficiency, utilizing keyboard-centric navigation and modal editing for minimal finger movement. Its core advantages include customizable key bindings, rapid text manipulation, and seamless integration with system tools, offering a powerful and user-friendly editing experience.

To make key bindings well organized and easy to remember and understand, they should follow logical and consistent patterns. This includes:

1. **Functional Relevance**

    Key bindings should be related to their functions. For example, all file operations use similar prefixes, and all search-related operations use another prefix.

2. **Positional Consistency**

    Key bindings should minimize finger movement. For example, using `hjkl` for navigation as they are centrally located on the keyboard.

3. **Mode Differentiation**

    Key bindings should have different prefixes or suffixes in different modes to help users understand their current mode. For instance, using the `leader` key as a prefix in normal mode and `Ctrl` key as a prefix in insert mode.

4. **Grouping and Hierarchy**

    Key bindings should be grouped by functionality and follow a hierarchical structure. For example, using the `leader` key followed by specific letters for function groups, with further actions appended to those letters.

## Improved Experience

### Improved Editor Experience

- Navigation: Motion and search functionalities are optimized for quick navigation and finding text within files.
- Simplified: Persistent editing position and undo history to maintain context and recover changes effortlessly.
- Simplified: Auto read when a file is changed from the outside to keep the editor in sync with file system changes.
- Git Integration: Integration with Git for seamless version control within the editor.
- Clipboard Integration: Integration with the system clipboard for easy copy-pasting between Vim and other applications.

### Improved Visual Experience

- Syntax Highlighting: Syntax highlighting to make code more readable and errors easier to spot.
- Visual Indicator: Visual indicators for preceding of line numbers, matching parentheses, indentation levels, search results, and current line to enhance focus and navigation.
- Status Line: Customized status line with Lightline to display essential information at a glance.
- Color Scheme: `PaperColor Dark` for a comfortable editing environment.

### Improved Coding Experience

- Default Style: 4 spaces for tabs, expanded tabs, highlighting of tabs, unwanted spaces, and folding.
- Consistent Style: Automatic formatting with code formatters (like, Prettier) to ensure consistent code style.
- Languages Support: Support for a wide range of file formats and encodings, ensuring compatibility with various file types.
- Realtime Linting: Realtime syntax checking and fixing (with ALE, Asynchronous Lint Engine).
- Code Navigation: Tag navigation and enhanced code referencing and navigation (CoC, Conquer of Completion for language server integration).

## Key Features

### Basic Key Binding Rule

| Key                 | Description                        | Example                                 |
|---------------------|------------------------------------|-----------------------------------------|
| **`,`**             | Leader Key.                        | As ordinal `\` does.                    |
| **`,` + letter**    | Specific Function Group.           | ex: `,n` for Filesystem Navigation.     |
| **`,,`**            | Mode Change.                       | ex: `,,s` for spell check mode change.  |
| **`<c-`** + letters | Specific Function Group.           | ex: `<c-w>` for window navigation.      |
| `=`                 | auto indent related key.           | ex: visual selection and `=` to format. |
| `][`                | as message navigation leading key. | ex: multi-selection navigation.         |
| `:` or `;`          | Command key (without shift).       | As ordinal ':' does.                    |

### Function Groups

| Leading Key | Function group                             | Plugins and Implementation                                                 |
|-------------|--------------------------------------------|----------------------------------------------------------------------------|
| **`,b`**    | Buffer control.                            | straightforward configuration (.vimrc).                                    |
| **`,c`**    | Code companion.                            | Copilot.                                                                   |
| **`,f`**    | Fuzzy finder.                              | Fuzzy finder (fzf).                                                        |
| **`,n`**    | NERDTree as filesystem navigation.         | NERDtree (nerdtree).                                                       |
| **`,m`**    | Markdown table mode functions leading key. | VIM Table Mode (vim-table-mode).                                           |
| **`,s`**    | Spell leading key.                         | Thesaurus (thesaurus_query.vim) and straightforward configuration (.vimrc) |
| **`,t`**    | Tag list leading key.                      | Tagbar (tagbar).                                                           |
| **`,g`**    | Git integration.                           | A Git Wrapper (vim-fugitive).                                              |
| **`,r`**    | Vim Run Command (.vimrc) management.       | straightforward configuration (.vimrc).                                    |
| **`,=`**    | Code or Text formatting.                   | Language specific style formatting.                                        |
| **`<c-n>`** | Multiple selection envoking.               | multi-cursor functionality (vim-visual-multi).                             |
| **`<c-w>`** | Window Control.                            | straightforward configuration (.vimrc).                                    |
| **`,S`**    | A fancy start screen.                      | The fancy start screen (startify).                                         |

### Mode Changing

| Leading Key | Mode                        | Default |
|-------------|-----------------------------|---------|
| **`,,m`**   | Toggle Markdown table mode. | Off     |
| **`,,g`**   | Toggle Visible Git Sign.    | Visible |
| **`,,p`**   | Toggle Paste mode.          | Off     |
| **`,,s`**   | Toggle Spell Check mode.    | Off     |
| **`,,z`**   | Toggle Wrap mode.           | Off     |

### Navigation Improvement

| Key Binding | Actions                               |
|-------------|---------------------------------------|
| WW          | Fast Forward words with eady motion.  |
| BB          | Fast Backward words with eady motion. |

### Editor Improvement

| Key Binding | Actions                               |
|-------------|---------------------------------------|
| zz          | Fast Save.                            |
| Q           | Fast Quit to close window or buffer.  |

## Featuring

### Onboarding

- A fancy startup page.
- Demand hints.

### Editor Navigation

**Moving Between Filesystem**

1. Filesystem
2. Finder

**Moving Between Opened Files**

1. Buffer
2. Tab
3. Window

**Moving Between Lines**

1. Faster move
2. Precise move
3. Marks
4. Searching

### Aesthetic Interface

1. lightline
2. Panels: undo, register

### IDE

**Moving Between Codes**

1. Source Code Tracing
2. Tags
3. Git

**Moving Between Messages**

1. Errors and Warnings

**Integrated**

1. git
2. system clipboard

## Theme

colorscheme

## Key Mapping Sheets

### Buffer and Line

| Key              | Action                  |
|------------------|-------------------------|
| **`gj`**         | Next opened buffer.     |
| **`gk`**         | Last opened buffer.     |
| **`g<tab>`**     | Previous opened buffer. |
| **`g<number>`**  | Goto buffer n.          |
| **`<leader>bd`** | Close buffer.           |

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
| `>` and `<` and `==` | Single line indent.                      |
| (VISUAL)`=`          | Multiple line indent.                    |
| `<leader>=t`         | Expand tabs for buffer or selection.     |

Different edit mode.

| Key                 | Action                       |
|---------------------|------------------------------|
| `<leader><leader>z` | Toggle word wrap on and off. |
| `<leader><leader>p` | Toggle paste mode.           |

### Clipboard

| Key         | Action                   |
|-------------|--------------------------|
| `<leader>u` | Open undo tree.          |
| `<a-p>`     | Cycle back yank history. |

### Misc

| Key          | Action                                                   |
|--------------|----------------------------------------------------------|
| `<leader>rc` | Open vimrc.                                              |
| `<leader>rr` | Reload vimrc.                                            |
| :SudoWrite   | Write with sudo, requires ssh-askpass to input password. |

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

### Markdown (`,m`)

How to enable `Markdown` feature:

| Key                     | Action                      |
|-------------------------|-----------------------------|
| **`<leader><leader>m`** | Toggle markdown table mode. |
| **`<leader>m`**         | Markdown table prefix key.  |

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
| **`<leader>ss`** | List suggested synonym.        |

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
| **(VISUAL) then `S`** | Surround edit.                                 |
| **`cif` `vic`**       | `f` (function) and `c` (class) as text object. |
| **cs\"\'**            | Replace surround symbol.                       |

### Multiple Selection Editing (`<c-n>`)

| Key                  | Action                                                                                 |
|----------------------|----------------------------------------------------------------------------------------|
| **`<c-n>`**          | Start multi-visual (EXTRA) mode: n confirm and q skip; `[ ]` for selection navigation. |
| *`<c-n>` then `\\a`* | Visual multi selection and align.                                                      |
| `<c-n>` then `\\N`   | Visual multi selection and insert leading number.                                      |

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

| Key             | Action         |
|-----------------|----------------|
| **`<leader>t`** | Toggle tagbar. |

Git Navigation:

| Key                 | Action                           |
|---------------------|----------------------------------|
| **`<leader>gb`**    | Open git blame.                  |
| **`<leader>gl`**    | Open git log.                    |
| **`<leader>gh`**    | Git hunks (editing) leading key. |
| `<leader><leader>g` | Toggle git hunks.                |
| `]g` or `[g`        | Navigate git hunks.              |

Warning/Error Navigation:

| Key          | Action                |
|--------------|-----------------------|
| `]e` or `[e` | Navigate lint errors. |
| `]d` or `[d` | Navigate diagnostics. |

### Auto Completion

| Key                 | Action                                                      |
|---------------------|-------------------------------------------------------------|
| **(INSERT)`<tab>`** | Auto completion.                                            |

### Documentation

| Key                 | Action                                                      |
|---------------------|-------------------------------------------------------------|
| **`K`**             | Open document.                                              |

## Support Languages and Filetype

- `javascript`
- `markdown`
- `html`
- `css`
- `python`
- `go`
- `rust`

## Compatibility

NVIM v0.10.0

## License

MIT
