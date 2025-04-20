## Begin

```
sudo su
cd /etc
rm -rf /etc/nixos
git clone https://github.com/lvnilesh/vimjoyer /etc/nixos
chown -R cloudgenius:users /etc/nixos
exit
```
## rebuild with flakes enabled
```
sudo nixos-rebuild switch --flake /etc/nixos/#nixos
```

## generating home.nix
```
nix run home-manager/master -- init
sudo cp ~/.config/home-manager/home.nix /etc/nixos/
```

## lock flakes

```
nix flake lock
```

https://github.com/vimjoyer

https://github.com/vimjoyer/flake-starter-config