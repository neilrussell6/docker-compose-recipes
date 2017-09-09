recipe 4 : experiments
---

 * ``make up`` start container
 * ``make shell`` enter shell as container user
 * ``make shellme`` enter shell as host user

 1. enter shell as container user
 
```bash
make shell
whoami
```

outputs:
```
docker
```

 2. create file as container user
 
```
cd code
touch a.txt
exit
```
 
 3. enter shell as host user
 
```bash
make shellme
whoami
```

outputs:
```
neil
```

 4. create file as host user
 
```bash
cd code
touch b.txt
exit
```

 5. check files:

```bash
ls -la
-rw-r--r--  1 me   me      0 Sep  9 19:31 a.txt
-rw-r--r--  1 me   me      0 Sep  9 19:32 b.txt
```

> both files belong to host user
