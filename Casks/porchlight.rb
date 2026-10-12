cask "porchlight" do
  version "0.1.0"
  sha256 "197dd60513c005b5776d47922833f8e6b3b0b3e3ed5173afd8458da076ec74b1"

  url "https://github.com/strazan/porchlight/releases/download/v#{version}/Porchlight-#{version}.zip"
  name "Porchlight"
  desc "Lets Claude, ChatGPT and other cloud agents use the MCP servers on your Mac"
  homepage "https://porchlight.sh"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Porchlight.app"

  uninstall quit: "sh.porchlight.Porchlight"

  zap trash: [
    "~/Library/Application Support/Porchlight",
    "~/Library/Caches/Porchlight",
    "~/Library/Preferences/sh.porchlight.Porchlight.plist",
  ]
end
