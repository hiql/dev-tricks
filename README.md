# Dev Tricks
Some stuff from daily development.

## Java

### Install a jar in your local maven repository.
```bash
mvn install:install-file -Dfile=./demo.jar -DgroupId=com.example -DartifactId=demo -Dversion=0.1.0 -Dpackaging=jar
```
