recipe 1
---

> interact with docker directly

start and build container

```
docker-compose up --build
```

run a bash script in container that creates file on host

```
docker-compose run --rm web bash code/main.sh
```

run a bash script in container that creates file on host (as host user)

```
docker-compose run -u $( id -u $USER ):$( id -g $USER ) --rm web bash code/main.sh
```

enter new shell within container (as host user)

```
docker-compose run -u $( id -u $USER ):$( id -g $USER ) --rm web bash
```

recipe 2
---

> interact with docker through GNU Make

 * ``make up`` start container through make
 * ``make run`` run a bash script in container that creates file on host
 * ``make runme`` run a bash script in container that creates file on host (as host user)
 * ``make shell`` enter new shell within container (as host user)

recipe 3
---

> build container with user account

 * ``make up`` start container
 * ``make shell`` enter shell as container user
 * ``make shellme`` enter shell as host user

recipe 4
---

> dependency management through make

 * ``make compile`` compile requirements text file with pip-tools inside container
 * ``make install`` install requirements with pip inside container
 * ``make update`` do both of the above

recipe 5
---

> dependency management through Dockerfile and make

When we run initial ``make up`` or ``make build`` or ``make buildup``  
Dockerfile will compile requirements text file and install requirements

recipe 6
---

> run make inside container

```
docker-compose run --rm web make sayhello
```

> TODO: how to run this as a windows user? 

recipe 7
---

> environments variables

recipe 8
---

> compile and install different target dependency files (including support for nested dependencies)

 * ``make build`` build container
 * ``make compile`` compile all requirement txt files
 * ``make install`` install base requirements
 * ``make install requirements=test`` install test requirements (which extends base requirements)
 * ``make clean`` delete all requirement txt files (run before ``make compile`` to force update all dependencies)

recipe 9
---

> passing arguments to make

```
$ make say WHAT="hello world"
hello world
```

```
$ make say
nothing
```
