## How to use (general Linux)
Install nix first using the following command:
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

Install home-manager:
```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

# remove default config
rm -rf ~/.config/home-manager
```

Clone this repo:
```
# if don't have git
nix-shell -p git
cd ~/.config
git clone git@github.com:Slijeff/my-nix-config.git
```

Activate:
```
home-manager switch --flake .#<version>
```
