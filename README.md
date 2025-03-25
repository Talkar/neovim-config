# Nvim config

## Prerequisites

### Setup Roslyn language server for LSP

1. Navigate to https://dev.azure.com/azure-public/vside/_artifacts/feed/vs-impl and download the .nupkg of the "Microsoft.CodeAnalysis.LanguageServer" package that matches your OS.
If none matches your OS, take the one named "Microsoft.CodeAnalysis.LanguageServer".
2. Unzip the content of the .nupkg into nvim-data/csharp/roslyn-lsp
3. Navigate to the folder and execute `dotnet Microsoft.CodeAnalysis.LanguageServer.dll --version`. The output should list the version if everything was successful

### Install codicons
https://github.com/ChristianChiarulli/neovim-codicons

### Run lazy and mason
Run :Lazy and ensure everything is updated

### Run mason
Run :Mason and install the following: 
LSP: 
* csharp_ls
* lua_ls
* roslyn
* rust-analyzer
* ts_ls

DAP: 
* netcoredbg

Linter: 
* dotenv-linter
* eslint_d

Formatter: 
* csharpier
* prettier
* stylua

### Run checkhealth
Run :checkhealth to ensure everything is in order
