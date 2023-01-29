#!/bin/sh

# keys

docker run -it --rm -v ${PWD}/keys.cs:/code/keys.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/keys.go:/code/keys.go -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code golang go run keys.go

docker run -it --rm -v ${PWD}/keys.js:/code/keys.js -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code node node keys.js

docker run -it --rm -v ${PWD}/keys.php:/code/keys.php -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code php php keys.php

docker run -it --rm --platform=linux/amd64 -v ${PWD}/keys.sh:/code/keys.sh -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code --entrypoint=sh alpine/openssl keys.sh

# docker run -it --rm --platform=linux/amd64 -v ${PWD}/keys.ps1:/code/keys.ps1 -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code mcr.microsoft.com/powershell pwsh keys.ps1



# encrypt

docker run -it --rm -v ${PWD}/encrypt.cs:/code/encrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/encrypt.go:/code/encrypt.go -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code golang go run encrypt.go

docker run -it --rm -v ${PWD}/encrypt.js:/code/encrypt.js -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code node node encrypt.js

docker run -it --rm -v ${PWD}/encrypt.php:/code/encrypt.php -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code php php encrypt.php

docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.sh:/code/encrypt.sh -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code --entrypoint=sh alpine/openssl encrypt.sh

docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.ps1:/code/encrypt.ps1 -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/powershell pwsh encrypt.ps1

# decrypt

docker run -it --rm -v ${PWD}/decrypt.cs:/code/decrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run

docker run -it --rm -v ${PWD}/decrypt.go:/code/decrypt.go -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code golang go run decrypt.go

docker run -it --rm -v ${PWD}/decrypt.js:/code/decrypt.js -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code node node decrypt.js

docker run -it --rm -v ${PWD}/decrypt.php:/code/decrypt.php -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code php php decrypt.php

docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.sh:/code/decrypt.sh -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code --entrypoint=sh alpine/openssl decrypt.sh

docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.ps1:/code/decrypt.ps1 -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/powershell pwsh decrypt.ps1




