$ErrorActionPreference = 'Stop'

function check_encrypt {
    param([string]$encrypted, [string]$name)
    if ($encrypted.Contains('zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM=')) {
        Write-Host "encrypt $name - ok" -ForegroundColor Green
    } else {
        Write-Error "encrypt $name - fail"
    }
}

function check_decrypt {
    param([string]$encrypted, [string]$name)
    if ($encrypted.Contains('Hello world, mac was here')) {
        Write-Host "decrypt $name - ok" -ForegroundColor Green
    } else {
        Write-Error "decrypt $name - fail"
    }
}

# encrypt

check_encrypt -name 'dotnet' -encrypted (
    docker run -it --rm -v ${PWD}/encrypt.cs:/code/encrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run
)

check_encrypt -name 'go' -encrypted (
    docker run -it --rm -v ${PWD}/encrypt.go:/code/encrypt.go -w /code golang go run encrypt.go
)

check_encrypt -name 'java' -encrypted (
    docker run -it --rm -v ${PWD}/encrypt.java:/code/encrypt.java -w /code openjdk java encrypt.java
)

check_encrypt -name 'node' -encrypted (
    docker run -it --rm -v ${PWD}/encrypt.js:/code/encrypt.js -w /code node node encrypt.js
)

check_encrypt -name 'php' -encrypted (
    docker run -it --rm -v ${PWD}/encrypt.php:/code/encrypt.php -w /code php php encrypt.php
)

check_encrypt -name 'pwsh' -encrypted (
    docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.ps1:/code/encrypt.ps1 -w /code mcr.microsoft.com/powershell pwsh encrypt.ps1
)

check_encrypt -name 'openssl' -encrypted (
    docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.sh:/code/encrypt.sh -w /code --entrypoint=sh alpine/openssl encrypt.sh
)


# decrypt

check_decrypt -name 'dotnet' -encrypted (
    docker run -it --rm -v ${PWD}/decrypt.cs:/code/decrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run
)

check_decrypt -name 'go' -encrypted (
    docker run -it --rm -v ${PWD}/decrypt.go:/code/decrypt.go -w /code golang go run decrypt.go
)

check_decrypt -name 'java' -encrypted (
    docker run -it --rm -v ${PWD}/decrypt.java:/code/decrypt.java -w /code openjdk java decrypt.java
)

check_decrypt -name 'node' -encrypted (
    docker run -it --rm -v ${PWD}/decrypt.js:/code/decrypt.js -w /code node node decrypt.js
)

check_decrypt -name 'php' -encrypted (
    docker run -it --rm -v ${PWD}/decrypt.php:/code/decrypt.php -w /code php php decrypt.php
)

check_decrypt -name 'pwsh' -encrypted (
    docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.ps1:/code/decrypt.ps1 -w /code mcr.microsoft.com/powershell pwsh decrypt.ps1
)

check_decrypt -name 'openssl' -encrypted (
    docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.sh:/code/decrypt.sh -w /code --entrypoint=sh alpine/openssl decrypt.sh
)


