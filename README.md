# Nvim config

## Prerequisites

### Setup Roslyn language server for LSP

1. Navigate to https://dev.azure.com/azure-public/vside/_artifacts/feed/vs-impl and download the .nupkg of the "Microsoft.CodeAnalysis.LanguageServer" package that matches your OS.
If none matches your OS, take the one named "Microsoft.CodeAnalysis.LanguageServer".
2. Unzip the content of the .nupkg into nvim-data/csharp/roslyn-lsp
3. Navigate to the folder and execute `dotnet Microsoft.CodeAnalysis.LanguageServer.dll --version`. The output should list the version if everything was successful
