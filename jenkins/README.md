build jenkins image

```
docker build -t jenkins-node .
```

You need 'jenkins-home' in current path and later running jenkins docker:
```
docker run --detach --publish 8080:8080 --volume .\jenkins-home:/var/jenkins_home --name jenkins-node jenkins-node
```