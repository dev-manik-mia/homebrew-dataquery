cask "dataquery" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "3c6d60c480a370ea7714e2c80c69a77c4e6667911744b1c15d1c20ed68534aa0",
         intel: "b92d2a35fad16e25a61761336f36467aaefdf22024d91d4057ea63a367b14a64"

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
