#!/bin/sh

# encode

docker run -it --rm -v ${PWD}/encode.cs:/code/encode.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/encode.go:/code/encode.go -w /code golang go run encode.go

docker run -it --rm -v ${PWD}/encode.java:/code/encode.java -w /code openjdk java encode.java

docker run -it --rm -v ${PWD}/encode.js:/code/encode.js -w /code node node encode.js

docker run -it --rm -v ${PWD}/encode.php:/code/encode.php -w /code php php encode.php

docker run -it --rm -v ${PWD}/encode.py:/code/encode.py -w /code python python encode.py

docker run -it --rm --platform=linux/amd64 -v ${PWD}/encode.ps1:/code/encode.ps1 -w /code mcr.microsoft.com/powershell pwsh encode.ps1

docker run -it --rm --platform=linux/amd64 -v ${PWD}/encode.sh:/code/encode.sh -w /code --entrypoint=sh alpine/openssl encode.sh

# decode

docker run -it --rm -v ${PWD}/decode.cs:/code/decode.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/decode.go:/code/decode.go -w /code golang go run decode.go

docker run -it --rm -v ${PWD}/decode.java:/code/decode.java -w /code openjdk java decode.java

docker run -it --rm -v ${PWD}/decode.js:/code/decode.js -w /code node node decode.js

docker run -it --rm -v ${PWD}/decode.php:/code/decode.php -w /code php php decode.php

docker run -it --rm -v ${PWD}/decode.py:/code/decode.py -w /code python python decode.py

docker run -it --rm --platform=linux/amd64 -v ${PWD}/decode.ps1:/code/decode.ps1 -w /code mcr.microsoft.com/powershell pwsh decode.ps1

docker run -it --rm --platform=linux/amd64 -v ${PWD}/decode.sh:/code/decode.sh -w /code --entrypoint=sh alpine/openssl decode.sh
