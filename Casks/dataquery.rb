cask "dataquery" do
  arch arm: "Silicon", intel: "Intel"

  version "0.3.1"
  sha256 arm:   "3a003b616a6011df42fafd82ad5274ee57b4f12ffb23bf1b20577ce09950a532",
         intel: "39abaf3cd1803fd51cbf7ba9682cfee0dd31a66cefa2ae90c6fed1e3a4284d80"

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
