# HexName

Check whether a hex name is available on hex.pm.

## Install

### From source

**clone**
```sh
git clone https://github.com/wesleimp/hex-name.git
cd hex-name
```

**get the dependencies**
```sh
mix deps.get
```

 **build**
 ```sh
 mix escript.build
```

**verify it works**
```sh
./hex-name -v
```

## Usage

```sh
$ hex-name haversine
Unavailable

$ hex-name blablablabla
Available
```