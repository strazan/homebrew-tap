cask "stacks" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/strazan/stacks/releases/download/v#{version}/Stacks-#{version}.zip"
  name "Stacks"
  desc "Menu bar app that shows your GitHub pull requests grouped into stacks"
  homepage "https://github.com/strazan/stacks"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "gh"
  depends_on macos: :sonoma

  app "Stacks.app"

  uninstall quit: "com.strazan.stacks"

  zap trash: [
    "~/Library/Caches/com.strazan.stacks",
    "~/Library/HTTPStorages/com.strazan.stacks",
    "~/Library/Preferences/com.strazan.stacks.plist",
  ]

  caveats <<~EOS
    Stacks reads your GitHub token from the GitHub CLI. Sign in once with:
      gh auth login
  EOS
end
