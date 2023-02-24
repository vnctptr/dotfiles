#!/usr/bin/env zsh

cd "$(dirname "${(%):-%N}")";

git pull

function doIt() {

  # Add dotfiles to ~
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude ".zshrc" \
		--exclude ".idea/" \
		-avh --no-perms . ~;

	# Make sure dotfilesrc is being sourced in zshrc (if it's not already being sourced)
	if ! grep --quiet ".dotfilesrc" ~/.zshrc
	then
	  echo "# This line was added added by dotfiles\nsource $HOME/.dotfilesrc" >> ~/.zshrc;
  fi

  # Add zshrc to dotfiles repository
	cp ~/.zshrc ~/.zshrc_dotfiles_copy
	rsync ~/.zshrc .;

	source ~/.zshrc;
}

# TODO add support for MacOS
if ! [ $# -eq 0 ] && [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read "$REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
