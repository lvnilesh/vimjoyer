[cloudgenius@vm:/etc]$ sudo su
[sudo] password for cloudgenius: 

[root@vm:/etc]# rm -rf nixos

[root@vm:/etc]# git clone https://github.com/lvnilesh/vimjoyer ./nixos

[root@vm:/etc]# chown -R cloudgenius:users ./nixos

[root@vm:/etc]# exit

[cloudgenius@vm:/etc]$ 


sudo nixos-rebuild switch --flake /etc/nixos/#nixos




## edit configuration.nix

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

## run
```
sudo nixos-build switch
```

## search for packages

https://search.nixos.org/packages

## initialize flake
```
cd /etc/nixos
sudo nix flake init --template github:vimjoyer/flake-starter-config
```

## rebuild with flakes enabled

```
sudo nixos-rebuild switch --flake /etc/nixos/#nixos
```

## lock flakes

```
nix flake lock
```

## rebuild with flakes enabled

```
sudo nixos-rebuild switch --flake /etc/nixos/#nixos
```


## home-manager option
```nix
home-manager = {
  # also pass inputs to home-manager modules
  extraSpecialArgs = {inherit inputs;};
  users = {
    "username" = import ./home.nix;
  };
};
```

## create main-user.nix


## update configuration.nix 
```nix

```

## flake.nix
```nix

```


## generating home.nix
```
nix run home-manager/master -- init
sudo cp ~/.config/home-manager/home.nix /etc/nixos/
```

https://github.com/vimjoyer

https://github.com/vimjoyer/flake-starter-config