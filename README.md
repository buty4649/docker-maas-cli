# docker-maas-cli
maas cli on docker

## Usage

```bash
MAAS_URL=<Specify your MAAS API URL>
MAAS_API_KEY=<Specify your MAAS API credentials>

docker run -it --rm -e MAAS_URL=$MAAS_URL -e MAAS_API_KEY=$MAAS_API_KEY buty4649/maas-cli:3.3-jammy
```

### Tips: Persisting MAAS Authentication Credentials

The MAAS cli saves authentication credentials in `$HOME/.maasclidb`. By persisting this file, you can skip authentication.

```bash
# Only for the first time
touch ~/.maasclidb
chmod 600 ~/.maasclidb
docker run -it --rm -e MAAS_URL=$MAAS_URL -e MAAS_API_KEY=$MAAS_API_KEY -v $HOME/.maasclidb:/root/.maasclidb buty4649/maas-cli:3.3-jammy

# From the second time onwards
docker run -it --rm -v $HOME/.maasclidb:/root/.maasclidb buty4649/maas-cli:3.3-jammy
```
