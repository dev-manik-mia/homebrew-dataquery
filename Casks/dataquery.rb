cask "dataquery" do
  arch arm: "Silicon", intel: "Intel"

  version "0.3.2"
  sha256 arm:   "bbd2dff7304a5d8ab2f913ff0b34fdc7331de578a9b8f5fa8f0c4c4b803e7788",
         intel: "9c08dfa5abd12c772584f67fc5430db84865f89b3168f48fd8e0a7630f85c9ab"

  url "https://pub-faabb9bbe1834f52801288324cd66617.r2.dev/downloads/DataQuery/Mac_#{arch}_latest.dmg"
  name "DataQuery"
  desc "Fast, safe desktop database client"
  homepage "https://dataquery.manikmia.com/"

  livecheck do
    url "https://github.com/dev-manik-mia/DataQuery"
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
