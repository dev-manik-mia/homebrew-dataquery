cask "dataquery" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "2139f5160b857ef92928856724b8e1b40e6abd11bc4f629b275d698828a2447b",
         intel: "50aedc9da7af2e3a09f090b2f0d3efa4a599473bb228dd6683d69c52b3b898b8"

  url "https://github.com/dev-manik-mia/DataQuery/releases/download/v#{version}/DataQuery_#{version}_#{arch}.dmg"
  name "DataQuery"
  desc "Fast, safe desktop database client"
  homepage "https://dataquery.manikmia.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # DataQuery updates itself (Settings → About → Updates).
  auto_updates true
  depends_on :macos

  app "DataQuery.app"

  # The app is not notarized yet; without this macOS reports it as damaged.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DataQuery.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.dataquery.app",
    "~/Library/Caches/dev.dataquery.app",
    "~/Library/Preferences/dev.dataquery.app.plist",
    "~/Library/Saved Application State/dev.dataquery.app.savedState",
    "~/Library/WebKit/dev.dataquery.app",
  ]
end
