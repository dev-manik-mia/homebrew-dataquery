cask "dataquery" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "ee8d7962147f240ed0055313e86f851c4d27e3bbeb9d68856cdeb2a92e755760",
         intel: "20837cc2e14c1472a650c55a2b403b6c468b0118caccefb35a45eed6ba222330"

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
