#!/bin/sh

docker run -it --rm -v ${PWD}/main.js:/code/main.js -w /code node node main.js

docker run -it --rm -v ${PWD}/main.go:/code/main.go -w /code golang go run main.go

docker run -it --rm -v ${PWD}/main.cs:/code/main.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/main.java:/code/main.java -w /code openjdk java main.java

docker run -it --rm -v ${PWD}/main.php:/code/main.php -w /code php php main.php

docker run -it --rm -v ${PWD}/main.py:/code/main.py -w /code python python main.py

docker run -it --rm --platform=linux/amd64 -v ${PWD}/main.ps1:/code/main.ps1 -w /code mcr.microsoft.com/powershell pwsh main.ps1

docker run -it --rm --platform=linux/amd64 -v ${PWD}/main.sh:/code/main.sh -w /code --entrypoint=sh alpine/openssl main.sh
