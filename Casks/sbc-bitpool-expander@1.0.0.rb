cask "sbc-bitpool-expander@1.0.0" do
  version "1.0.0"
  sha256 "14906fdb287afb1f93b0fdf3579432081e7a3e9e9ad9638d2121c7bb559df14d"

  url "https://github.com/ololx/sbc-bitpool-expander/releases/download/v#{version}/sbc.bitpool.expander.app.zip",
      verified: "github.com/ololx/sbc-bitpool-expander/"
  name "SBC Bitpool Expander"
  desc "macOS app to adjust Bluetooth SBC bitpool value"
  homepage "https://github.com/ololx/sbc-bitpool-expander"

  depends_on macos: ">= :high_sierra"

  app "sbc bitpool expander.app"

  zap trash: [
    "~/Library/Preferences/ololx.sbc-bitpool-expander.plist",
    "~/Library/Saved Application State/ololx.sbc-bitpool-expander.savedState",
  ]
end
