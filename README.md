## Image to build packages

```
docker build -t nx-node .
```

# Example build

```
docker run --rm --volume .:/var/project nx-node npm install;npx nx build jenkinsen
```