#!/bin/sh

echo encrypt

docker run -it --rm -v ${PWD}/encrypt.js:/code/encrypt.js -w /code node node encrypt.js

docker run -it --rm -v ${PWD}/encrypt.go:/code/encrypt.go -w /code golang go run encrypt.go

docker run -it --rm -v ${PWD}/encrypt.cs:/code/encrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/encrypt.java:/code/encrypt.java -w /code openjdk java encrypt.java

docker run -it --rm -v ${PWD}/encrypt.php:/code/encrypt.php -w /code php php encrypt.php

# docker run -it --rm -v ${PWD}/encrypt.py:/code/encrypt.py -w /code python python encrypt.py

docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.ps1:/code/encrypt.ps1 -w /code mcr.microsoft.com/powershell pwsh encrypt.ps1

docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.sh:/code/encrypt.sh -w /code --entrypoint=sh alpine/openssl encrypt.sh

echo decrypt

docker run -it --rm -v ${PWD}/decrypt.js:/code/decrypt.js -w /code node node decrypt.js

docker run -it --rm -v ${PWD}/decrypt.go:/code/decrypt.go -w /code golang go run decrypt.go

docker run -it --rm -v ${PWD}/decrypt.cs:/code/decrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/decrypt.java:/code/decrypt.java -w /code openjdk java decrypt.java

docker run -it --rm -v ${PWD}/decrypt.php:/code/decrypt.php -w /code php php decrypt.php

# docker run -it --rm -v ${PWD}/decrypt.py:/code/decrypt.py -w /code python python decrypt.py

docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.ps1:/code/decrypt.ps1 -w /code mcr.microsoft.com/powershell pwsh decrypt.ps1

docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.sh:/code/decrypt.sh -w /code --entrypoint=sh alpine/openssl decrypt.sh
