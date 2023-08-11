# docker-maas-cli
maas cli on docker

## Usage

```bash
MAAS_URL=<Specify your MAAS API URL>
MAAS_API_KEY=<Specify your MAAS API credentials>

docker run -it --rm -e MAAS_URL=$MAAS_URL -e MAAS_API_KEY=$MAAS_API_KEY buty4649/maas-cli:3.3-jammy
```

### Tips: Persisting MAAS Authentication Credentials

The MAAS cli saves authentication credentials in `$HOME/.maascli.db`. By persisting this file, you can skip authentication.

```bash
# Only for the first time
touch ~/.maascli.db
chmod 600 ~/.maascli.db
docker run -it --rm -e MAAS_URL=$MAAS_URL -e MAAS_API_KEY=$MAAS_API_KEY -v $HOME/.maascli.db:/root/.maascli.db buty4649/maas-cli:3.3-jammy

# From the second time onwards
docker run -it --rm -v $HOME/.maascli.db:/root/.maascli.db buty4649/maas-cli:3.3-jammy
```
