# Docker setup for nginx, mysql and php
#### Usage
(Optional) Add an alias for docker-compose
```bash
nano ~/.bashrc
```

Add the following line ``` alias dc="docker-compose"``` at the end of the file and then apply the changes

```bash
source ~/.bashrc
```

Run the command (in the directory where docker-compose.yaml file is stored)
```bash
dc up
```

#### Use phpcs in PHPStorm

Use the file ```scripts/phpcs.sh``` as path in ```File -> Settings -> Languages & Frameworks -> Quality Tools -> Code Sniffer -> ... -> PHP Code Sniffer path```
