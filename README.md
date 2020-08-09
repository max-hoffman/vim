A vimfiles collection tailored for Erlang development on Windows 7 / Server 2008.

Run install.cmd in an Administrator shell (needed for creating symlinks).

The default GUI font is [DejaVu Sans Mono](http://dejavu-fonts.org) because it works nicely with the NERDtree plugin.

Inspired in part by [Vimcast 27](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen)

## Usage

Install or update with submodules:
```bash
git clone --recursive [this repo]
git submodule update --init --recursive
```

Install pathogen:
```bash
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

(From pathogen docs, expects these dirs to exist)
```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

