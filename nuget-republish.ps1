# Set the package name, original feed URL, new feed URL, and new version number
$packageName = 'your-package-name'
$originalFeedUrl = 'https://pkgs.dev.azure.com/your-organization/_packaging/your-original-feed/nuget/v3/index.json'
$newFeedUrl = 'https://pkgs.dev.azure.com/your-organization/_packaging/your-new-feed/nuget/v3/index.json'
$newVersion = '1.0.1'  # replace with your new version number

# Set the NuGet API key (replace 'your-api-key' with your actual API key)
$apiKey = 'your-api-key'

# Download the package from the original feed
nuget sources Add -Name "OriginalFeed" -Source $originalFeedUrl -UserName AzureDevOps -Password $apiKey
nuget install $packageName -Source "OriginalFeed"

# Update the version number
# This requires the NuGet Package Explorer command line tool (https://github.com/NuGetPackageExplorer/NuGetPackageExplorer)
# Replace 'path-to-npe.exe' with the actual path to npe.exe
npe.exe setversion .\$packageName.$oldVersion.nupkg $newVersion

# Publish the package to the new feed
nuget sources Add -Name "NewFeed" -Source $newFeedUrl -UserName AzureDevOps -Password $apiKey
nuget push .\$packageName.$newVersion.nupkg -Source "NewFeed"