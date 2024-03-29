# Dotfiles for ZSH

## Installation

```bash
git clone https://github.com/vnctptr/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source ./bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

## Saving .zshrc

The bootstrapper will add the following line to your `.zshrc` (if not already present):
```bash
source $HOME/.dotfilesrc
``` 
It will also store a copy of your `.zshrc` in the repository. It will NOT copy `.zsrhc` from the repository to your home folder. 

## Customization

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-L26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.


## Thanks to…

* [Matt Stauffer](https://mattstauffer.com/) and his [ohmyzsh-dotflies](https://github.com/mattstauffer/ohmyzsh-dotfiles)
* [Zach Holman](http://zachholman.com) and his [dotfiles repo](https://github.com/holman/dotfiles)

Bootstrapper based on [Mathias Bynens'](https://mathiasbynens.be/) [bootstrapper](https://github.com/mathiasbynens/dotfiles).
