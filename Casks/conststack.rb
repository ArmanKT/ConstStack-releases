cask "conststack" do
  version "1.1.2"
  sha256 "166931359545ce83ceadba082111a41d265eabe6fec7aeed527c704a59195121"

  url "https://github.com/ArmanKT/ConstStack-releases/releases/download/v#{version}/ConstStack-macOS-v#{version}.dmg"
  name "ConstStack"
  desc "Ultra-Fast, Zero-Config Local Web Development Environment for macOS"
  homepage "https://constmind.com"

  livecheck do
    url "https://api.github.com/repos/ArmanKT/ConstStack-releases/releases/latest"
    strategy :json do |json|
      json["tag_name"]&.sub(/^v/i, "")
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "ConstStack.app"

  zap trash: [
    "~/.const_stack",
    "~/Library/Application Support/ConstStack",
    "~/Library/Preferences/com.constmind.conststack.plist",
    "~/Library/Logs/ConstStack",
  ]
end
