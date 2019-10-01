# Docker setup for nginx, mysql and php
#### Usage
(Optional) Add an alias for docker-compose
```bash
nano ~/.bashrc
```

Add line ``` alias dc="docker-compose"``` at the end and then apply the changes

```bash
source ~/.bashrc
```

Run the command (where the docker-compose.yaml file is located)
```bash
dc up
```

#### Use phpcs in PHPStorm

Use the file ```scripts/php.sh``` as path in ```File -> Settings -> Languages & Frameworks -> Quality Tools -> Code Sniffer -> ... -> PHP Code Sniffer path```
