$ErrorActionPreference = 'Stop'

function check_hash {
    param([string]$hashed, [string]$name)

    if ($hashed.Contains('ZWk2HNlkmRLxMeoKc4DKoQPRASv1HFEW+646rfj7rMg=')) {
        Write-Host "hash $name - ok" -ForegroundColor Green
    } else {
        Write-Error "hash $name - fail"
    }
}

check_hash -name 'dotnet' -hashed (
    docker run -it --rm -v ${PWD}/main.cs:/code/main.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run
)

check_hash -name 'go' -hashed (
    docker run -it --rm -v ${PWD}/main.go:/code/main.go -w /code golang go run main.go
)

check_hash -name 'java' -hashed (
    docker run -it --rm -v ${PWD}/main.java:/code/main.java -w /code openjdk java main.java
)

check_hash -name 'node' -hashed (
    docker run -it --rm -v ${PWD}/main.js:/code/main.js -w /code node node main.js
)

check_hash -name 'php' -hashed (
    docker run -it --rm -v ${PWD}/main.php:/code/main.php -w /code php php main.php
)

check_hash -name 'pwsh' -hashed (
    docker run -it --rm --platform=linux/amd64 -v ${PWD}/main.ps1:/code/main.ps1 -w /code mcr.microsoft.com/powershell pwsh main.ps1
)

check_hash -name 'python' -hashed (
    docker run -it --rm -v ${PWD}/main.py:/code/main.py -w /code python python main.py
)

check_hash -name 'openssl' -hashed (
    docker run -it --rm --platform=linux/amd64 -v ${PWD}/main.sh:/code/main.sh -w /code --entrypoint=sh alpine/openssl main.sh
)
