cask "create-symlink" do
  version "1.0.0"
  sha256 "a3663161669a0811f1fe9cf1f2f4b61cbd2f48635f7721c81bc6b6f06b155979"

  url "https://github.com/ololx/create-symlink/releases/download/v#{version}/create.symlink.workflow.zip",
      verified: "github.com/ololx/create-symlink/"
  name "Create Symlink"
  desc "Simple Automator Quick Action to create symbolic links via Finder"
  homepage "https://github.com/ololx/create-symlink"

  artifact "create symlink.workflow", target: "#{ENV["HOME"]}/Library/Services/create symlink.workflow"

  postflight do
    # Refresh Finder so Quick Actions list updates
    system_command "/usr/bin/killall", args: ["Finder"], sudo: false
  end

  zap trash: [
    "~/Library/Services/create symlink.workflow",
  ]

  caveats <<~EOS
    The workflow was installed to:
      ~/Library/Services/create symlink.workflow

    It should appear automatically as a Service (Quick Action) in Finder.

    If it does not:
      1. Open System Settings → Privacy & Security → Extensions → Finder
      2. Enable the "create symlink" Quick Action
      3. Restart Finder with:
           killall Finder

    Then right-click a file or folder in Finder and choose:
      Quick Actions → create symlink
  EOS
end
