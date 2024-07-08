# Set the package name, original feed URL, new feed URL, and new version number
$packageName = 'your-package-name'
$originalFeedUrl = 'https://pkgs.dev.azure.com/your-organization/_packaging/your-original-feed/npm/registry/'
$newFeedUrl = 'https://pkgs.dev.azure.com/your-organization/_packaging/your-new-feed/npm/registry/'
$newVersion = '1.0.1'  # replace with your new version number

# Set the npm auth token (replace 'your-auth-token' with your actual auth token)
$env:NPM_TOKEN = 'your-auth-token'

# Download the package from the original feed
npm config set registry $originalFeedUrl
npm install $packageName

# Update the version number
cd .\node_modules\$packageName
npm version $newVersion

# Publish the package to the new feed
npm config set registry $newFeedUrl
npm publish