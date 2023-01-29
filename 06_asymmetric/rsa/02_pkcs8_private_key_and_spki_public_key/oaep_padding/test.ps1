$ErrorActionPreference = 'Stop'

$expected = 'Hello world, mac was here'

# keys

function keys_dotnet {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/keys.cs:/code/keys.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run
}

function keys_go {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/keys.go:/code/keys.go -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code golang go run keys.go
}

function keys_node {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/keys.js:/code/keys.js -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code node node keys.js
}

function keys_php {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/keys.php:/code/keys.php -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code php php keys.php
}

function keys_openssl {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm --platform=linux/amd64 -v ${PWD}/keys.sh:/code/keys.sh -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/public.pem:/code/public.pem -w /code --entrypoint=sh alpine/openssl keys.sh
}

# encrypt

function encrypt_dotnet {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/encrypt.cs:/code/encrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run
}

function encrypt_go {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/encrypt.go:/code/encrypt.go -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code golang go run encrypt.go
}

function encrypt_node {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/encrypt.js:/code/encrypt.js -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code node node encrypt.js
}

function encrypt_php {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/encrypt.php:/code/encrypt.php -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code php php encrypt.php
}

function encrypt_openssl {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.sh:/code/encrypt.sh -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code --entrypoint=sh alpine/openssl encrypt.sh
}

function encrypt_pwsh {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm --platform=linux/amd64 -v ${PWD}/encrypt.ps1:/code/encrypt.ps1 -v ${PWD}/public.pem:/code/public.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/powershell pwsh encrypt.ps1
}

# decrypt

function decrypt_dotnet {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/decrypt.cs:/code/decrypt.cs -v ${PWD}/dotnet.csproj:/code/dotnet.csproj -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/dotnet/sdk:7.0 dotnet run
}

function decrypt_go {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/decrypt.go:/code/decrypt.go -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code golang go run decrypt.go
}

function decrypt_node {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/decrypt.js:/code/decrypt.js -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code node node decrypt.js
}

function decrypt_php {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm -v ${PWD}/decrypt.php:/code/decrypt.php -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code php php decrypt.php
}

function decrypt_openssl {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.sh:/code/decrypt.sh -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code --entrypoint=sh alpine/openssl decrypt.sh
}

function decrypt_pwsh {
    Write-Host $MyInvocation.MyCommand -ForegroundColor Cyan

    docker run -it --rm --platform=linux/amd64 -v ${PWD}/decrypt.ps1:/code/decrypt.ps1 -v ${PWD}/private.pem:/code/private.pem -v ${PWD}/protected.txt:/code/protected.txt -w /code mcr.microsoft.com/powershell pwsh decrypt.ps1
}

function check_decrypt($actual) {
    if (-not $actual.Contains($expected)) {
        # Write-Host "fail" -ForegroundColor Red
        Write-Error "fail"
    } else {
        Write-Host "ok" -ForegroundColor Green
    }
}

function check_private_key {
    $result=$(openssl rsa -in private.pem -check)
    if ($result.Contains("RSA key ok")) {
        Write-Host "ok" -ForegroundColor Green
    } else {
        Write-Host $result
        # Write-Host "fail" -ForegroundColor Red
        Write-Error "fail"
    }
}

function check_public_key {
    $result=$(openssl rsa -inform PEM -pubin -in public.pem -text -noout)
    if ($result.Contains("RSA Public-Key: (2048 bit)")) {
        Write-Host "ok" -ForegroundColor Green
    } else {
        Write-Host $result
        # Write-Host "fail" -ForegroundColor Red
        Write-Error "fail"
    }
}

function check_keys {
    check_private_key
    check_public_key
}

function check_decrypt_all {
    $decryptFunctionNames = Get-Command -CommandType Function -Name 'decrypt_*' | Select-Object -ExpandProperty Name
    foreach($fn in $decryptFunctionNames) {
        $output=$(&"$fn")
        $found = $output | Where-Object { $_.Contains($expected) }
        
        if ($found) {
            Write-Host "$fn - ok" -ForegroundColor Green
        } else {
            Write-Error "$fn - fail"
        }
    }
}

function check_encrypt_decrypt_all {
    foreach($enc in Get-Command -CommandType Function -Name 'encrypt_*' | Select-Object -ExpandProperty Name) {
        cowsay "$enc"
        print_divider('-')

        &"$enc"
        check_decrypt_all
        print_divider('-')
    }
}

function print_divider($char) {
    Write-Host ""
    Write-Host ($char*60) -ForegroundColor Gray
    Write-Host ""
}










# --------------------------------------------------
#  _______ 
# < TESTS >
#  ------- 
#         \   ^__^
#          \  (oo)\_______
#             (__)\       )\/\
#                 ||----w |
#                 ||     ||
# --------------------------------------------------


# openssl

keys_openssl
check_keys
encrypt_openssl
check_decrypt(decrypt_openssl)

# keys basic

$keysFunctionNames = Get-Command -CommandType Function -Name 'keys_*' | Select-Object -ExpandProperty Name
foreach($keys in $keysFunctionNames) {
    &"$keys"
    check_keys
    encrypt_openssl
    check_decrypt(decrypt_openssl)
}

# decrypt current
keys_openssl
check_keys
encrypt_openssl
check_decrypt_all

# encryp decrypt cycle for current keys
keys_php
check_encrypt_decrypt_all

# full check
foreach($keys in Get-Command -CommandType Function -Name 'keys_*' | Select-Object -ExpandProperty Name) {
    cowsay "$keys"
    print_divider('=')

    &"$keys"

    check_encrypt_decrypt_all

    print_divider('=')
}


Write-Host "DONE"
