cask "dataquery" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "6491ca9641ad9a3d502ba94cebc6a7103ed8e709b16b27dba015393b0c348203",
         intel: "c77f36b97f2df55b73b865d130c52d48906f31c55f58e4c44cb2e4bdcdfbdbf8"

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
