# 4mbl/templates

> Starter templates for various languages and frameworks.

## Usage

The following command will download the template for the specified language and extract it to the specified directory.

```sh
curl -sL https://init.4mbl.net | bash -s <lang> <name>
```

Alternatively you can directly select the language on the URL.

### Python

```sh
curl -sL https://init.4mbl.net/python | bash -s <name>
```

### Java (Maven)

```sh
curl -sL https://init.4mbl.net/java | bash -s <name>
```

### Go

```sh
curl -sL https://init.4mbl.net/golang | bash -s <name>
```

## Other

These are some tools that I use, but haven't created templates for yet.

### Go - Cobra CLI

More information on [Cobra CLI](https://github.com/spf13/cobra-cli/blob/main/README.md).

```sh
# go install github.com/spf13/cobra-cli@latest

go mod init <name>
cobra-cli init <name>
```
