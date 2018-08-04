# dotfiles

## TODO

restructure rcfiles - extract heroku, general reshuffle and tidy up.

## Usage

```
cd ~
ln -s DOTFILES/.gitconfig .
cp DOTFILES/.gitconfig.local .
# vi .gitconfig.local

```

Modify ~/.gitconfig.local as necessary.
Append the following to ~/.bashrc (TODO: why is this not in one of the rcfiles?)

```
function code_find() {
  ack --python --sql --js --shell -A 2 --smart-case --pager="maybe-page.sh" "$@"
}
alias "?"=code_find
```

In ~/.bashrc, export JIRA_URL=... to use `jira`.

In ~/.profile, add

```
export GIT_BASEDIR=...

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$GIT_BASEDIR/dotfiles/bin" ]; then
    PATH="$PATH:$GIT_BASEDIR/dotfiles/bin"
fi
```

## SSH config
To have multiple SSH keys for separate services, add the following to ~/.ssh/config

```
# e.g. for a local vm, to access via "ssh myFriendlyHostname"
Host myFriendlyHostname
	Hostname 192.168.10.22
	User ubuntu
	IdentityFile ~/.ssh/id_rsa_localvm

Host personal
	Hostname github.com
	User git
	IdentityFile ~/.ssh/id_rsa_git_personal

Host work
	Hostname github.com
	User git
	IdentityFile ~/.ssh/id_rsa_git_work
```
