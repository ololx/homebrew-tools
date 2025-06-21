cask "create-symlink" do
  version "1.0.0"
  sha256 "a3663161669a0811f1fe9cf1f2f4b61cbd2f48635f7721c81bc6b6f06b155979"

  url "https://github.com/ololx/create-symlink/releases/download/v#{version}/create.symlink.workflow.zip",
      verified: "github.com/ololx/create-symlink/"
  name "Create Symlink"
  desc "Simple macOS Automator workflow providing GUI for symbolic link creation"
  homepage "https://github.com/ololx/create-symlink"

  depends_on macos: ">= :yosemite"

  artifact "create symlink.workflow", target: "#{ENV['HOME']}/Library/Services/create symlink.workflow"

  zap trash: [
    "~/Library/Services/create symlink.workflow"
  ]


  caveats <<~EOS
    The workflow will be installed into:
      ~/Library/Services/

    You can use it via Finder context menu:
      "Quick Actions" → "create symlink"
  EOS
end
