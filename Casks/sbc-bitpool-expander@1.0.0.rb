cask "sbc-bitpool-expander@1.0.0" do
  version "1.0.0"
  sha256 "14906fdb287afb1f93b0fdf3579432081e7a3e9e9ad9638d2121c7bb559df14d"

  url "https://github.com/ololx/sbc-bitpool-expander/releases/download/v#{version}/sbc.bitpool.expander.app.zip",
      verified: "github.com/ololx/sbc-bitpool-expander/"
  name "SBC Bitpool Expander"
  desc "macOS app to adjust Bluetooth SBC bitpool value"
  homepage "https://github.com/ololx/sbc-bitpool-expander"

  livecheck do
    skip "Pinned legacy 1.0.0 track"
  end

  depends_on macos: ">= :high_sierra"

  conflicts_with cask: [
    "sbc-bitpool-expander"
  ]
  
  app "sbc bitpool expander.app" 

  postflight do
    require "pathname"

    app_path = Pathname.new("#{appdir}/sbc bitpool expander.app")
    if app_path.exist?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", app_path.to_s],
                     sudo: false,
                     must_succeed: false
    end

    system_command "/usr/bin/killall",
                   args: ["-KILL", "bluetoothaudiod"],
                   sudo: false,
                   must_succeed: false
  end

  uninstall quit: "ololx.sbc-bitpool-expander"

  uninstall_postflight do
    system_command "/usr/bin/defaults",
                   args: ["delete", "com.apple.bluetoothaudiod"],
                   sudo: false,
                   must_succeed: false

    system_command "/usr/bin/killall",
                   args: ["-KILL", "cfprefsd"],
                   sudo: false,
                   must_succeed: false

    system_command "/usr/bin/killall",
                   args: ["-KILL", "bluetoothaudiod"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/ololx.sbc-bitpool-expander.plist",
    "~/Library/Saved Application State/ololx.sbc-bitpool-expander.savedState",
    "~/Library/Preferences/com.apple.bluetoothaudiod.plist",
  ]

  caveats <<~EOS
    Installed to:
      #{appdir}/sbc bitpool expander.app

    Launch:
      • Finder: double-click “sbc bitpool expander.app”
      • Terminal: open "#{appdir}/sbc bitpool expander.app"

    If changes don’t take effect:
      • Reconnect your Bluetooth headphones or toggle Bluetooth off/on.
      • Optionally restart the Bluetooth audio daemon:
          killall bluetoothaudiod
  EOS
end

