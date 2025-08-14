cask "create-symlink" do
  version "1.0.0"
  sha256 "a3663161669a0811f1fe9cf1f2f4b61cbd2f48635f7721c81bc6b6f06b155979"

  url "https://github.com/ololx/create-symlink/releases/download/v#{version}/create.symlink.workflow.zip",
      verified: "github.com/ololx/create-symlink/"
  name "Create Symlink"
  desc "Automator Quick Action / Service to create symbolic links via Finder"
  homepage "https://github.com/ololx/create-symlink"

  livecheck do
    url :url
    strategy :github_latest
  end

  preflight do
    require "fileutils"
    services_dir = File.expand_path("~/Library/Services")
    FileUtils.mkdir_p(services_dir) unless Dir.exist?(services_dir)
  end

  artifact "create symlink.workflow",
           target: "#{Dir.home}/Library/Services/create symlink.workflow"

  postflight do
    require "pathname"
    workflow_target = Pathname.new(Dir.home).join("Library/Services/create symlink.workflow")

    if workflow_target.exist?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", workflow_target.to_s],
                     sudo: false,
                     must_succeed: false
    end

    system_command "/usr/bin/killall",
                   args: ["Finder"],
                   sudo: false,
                   must_succeed: false
  end

  uninstall delete: "#{Dir.home}/Library/Services/create symlink.workflow"

  uninstall_postflight do
    system_command "/usr/bin/killall",
                   args: ["Finder"],
                   sudo: false,
                   must_succeed: false
  end

  caveats <<~EOS
    Installed to:
      ~/Library/Services/create symlink.workflow

    Where to find it in Finder:
      • macOS 10.10–10.13 (Yosemite–High Sierra): Context menu → Services → create symlink
      • macOS 10.14+ (Mojave and later): Context menu → Quick Actions → create symlink

    If it doesn’t appear:
      • Ventura/Sonoma (13+): System Settings → Privacy & Security → Extensions → Finder → enable “create symlink”
      • Monterey or earlier (12 and below): System Preferences → Keyboard → Shortcuts → Services → enable “create symlink”
        (on 10.14+ you can also check: System Preferences → Extensions → Finder)
      • Then restart Finder:
          killall Finder
  EOS
end
