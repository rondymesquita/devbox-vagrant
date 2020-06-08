# My custom dev box using vagrant

With a collection of bash scripts of commom used tools, applications and environments.


## Requirements

- Vagrant: 2.2.9

## Configuration
```bash
chmod +x configure.sh && ./configure.sh
```

## Up
```bash
# Will up without any provisioning
vagrant up
```

## Provision

Any existing file on `scripts` folder will have a proper provision name.

E.g.: `docker.sh` file generates `docker` provision.

```bash
vagrant provision --provision-with docker
```
