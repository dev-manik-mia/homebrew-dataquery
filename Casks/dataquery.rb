cask "dataquery" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "265fba6130407adaa4b16522b038495448436cd66fabb305c325c8164f3d524d",
         intel: "27032b915f46bfffc6306474ad9ac7d2129cb03050fbea5a5f6cd1d5ccac6051"

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
