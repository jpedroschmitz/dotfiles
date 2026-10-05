# Dotfiles

> Warning: If you want to give these dotfiles a try, you should first review the code and remove things you don’t want or need. Use at your own risk! I also recommend you take a look at [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles) repository; it contains more macOS system modifications.

Personal dotfiles for macOS.

## Installation

1. Update macOS and sign in to the App Store.
2. Install the Xcode Command Line Tools:

   ```sh
   xcode-select --install
   ```

3. Run the setup script. It clones the repository to `~/www/dotfiles` and gets everything ready =D

   ```sh
   curl -fsSL https://raw.githubusercontent.com/jpedroschmitz/dotfiles/HEAD/.macos | bash
   ```

   It will ask for your password, an SSH key passphrase, a 1Password sign-in and your git name and email along the way.

4. Follow the TODO list printed at the end, then restart.

## After installing

### SSH

Add the new SSH key to [GitHub](https://github.com/settings/keys):

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```

### GPG (verified commits)

Commits are signed with GPG (`commit.gpgsign = true`). The script imports the keys from the `GPG` item in 1Password and sets the signing key. To do it by hand:

```sh
op read "op://Personal/GPG/gpg-pub.asc" | gpg --import
op read "op://Personal/GPG/gpg-sc.asc" | gpg --batch --import
gpg --list-secret-keys --keyid-format=long
git config --global user.signingkey <key-id>
```

If the key isn't on GitHub yet, add it to [GitHub](https://github.com/settings/keys) so commits show as Verified:

```sh
gpg --armor --export <key-id> | pbcopy
```

### Keeping it in sync

Check the Brewfile against what is installed:

```sh
brew bundle check --file=~/www/dotfiles/Brewfile --verbose
```

## Thanks to...

- [Mathias](https://github.com/mathiasbynens/dotfiles)
- [Kent C. Dodds](https://github.com/kentcdodds/dotfiles)
