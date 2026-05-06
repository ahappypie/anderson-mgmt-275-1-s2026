---
name: nix
description: 
    Guides to use the Nix command line tool. Use when `flake.nix` and/or `flake.lock` files are present at the root of the repository.
---
# What is Nix

Nix is a set of tools for building software deterministically. This is vitally important to ensuring software is reproducible. The Nix ecosystem is large:
- `nix` - command line tool
- `Nix` - the programming language
- `nixpkgs` - largest software package repository in existence
- `nixos` - linux distribution managed using the above tools

You can safely ignore `nixos` unless otherwise instructed. You will use the `nix` CLI, the `Nix` language, and install packages from `nixpkgs`.

# Using the Nix Development Environment

In repositories that use Nix Shells (denoted by the presence of `flake.nix` and/or `flake.lock` files at the root of the repository), you must prepend `nix develop --command` before running any shell commands. For example, to run `go version`, you would need to use the following code:

```
nix develop --command go version
```

# Modifying the Environment

If you need a new command line tool, in most cases it can be added to the `commonPackages` list in `flake.nix` using Nix syntax. Modifying this file introduces serious supply chain security risk. **Do not under any cirumstances modify this file without asking for change approval**.

# Formatting Nix Code

If you modify any Nix code, you need to run `nix fmt` on the modified file. For example, if you modify `flake.nix`:

```
nix fmt flake.nix
```