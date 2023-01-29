# Base64 URL Safe

Technically it is the same Base64 but:

- `/` replaced with `_`
- `+` replaced with `-`
- `=` trimmed from end

Which makes it safe to use it let say as route parameter in URL

Test samples

| decoded                   | encoded                            |
| ------------------------- | ---------------------------------- |
| Hello world, mac was here | SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ |
