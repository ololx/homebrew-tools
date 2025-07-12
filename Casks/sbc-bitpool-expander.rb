cask "sbc-bitpool-expander" do
  version "4.0.1"
  sha256 "4d0aac183cdc00a4ad55adbdc491e11bf1ea1f9038afd8b031abb48702b8b513"

  url "https://github.com/ololx/sbc-bitpool-expander/releases/download/v#{version}/sbc.bitpool.expander.app.zip",
      verified: "github.com/ololx/sbc-bitpool-expander/"
  name "SBC Bitpool Expander"
  desc "macOS app to adjust Bluetooth SBC bitpool value"
  homepage "https://github.com/ololx/sbc-bitpool-expander"

  depends_on macos: ">= :high_sierra"

  app "sbc bitpool expander.app"

  postflight do
    system_command "xattr",
      args: ["-d", "com.apple.quarantine", "#{appdir}/sbc bitpool expander.app"],
      sudo: false
  end
  
  zap trash: [
    "~/Library/Preferences/ololx.sbc-bitpool-expander.plist",
    "~/Library/Saved Application State/ololx.sbc-bitpool-expander.savedState",
  ]
end
