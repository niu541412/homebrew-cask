cask "swiftbar" do
  version "2.0.1"
  sha256 "ac70a9cbdde20d58dae27d360764aa42c3698f6e1bc4618c4b03297a2cee67fa"

  url "https://github.com/swiftbar/SwiftBar/releases/download/v#{version}/SwiftBar.v#{version}.zip",
      verified: "github.com/swiftbar/SwiftBar/"
  name "SwiftBar"
  desc "Menu bar customization tool"
  homepage "https://swiftbar.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "SwiftBar.app"

  zap trash: [
    "~/Library/Application Scripts/com.ameba.SwiftBar-LaunchAtLoginHelper",
    "~/Library/Caches/com.ameba.SwiftBar",
    "~/Library/Containers/com.ameba.SwiftBar-LaunchAtLoginHelper",
    "~/Library/Preferences/com.ameba.SwiftBar.plist",
  ]
end
