cask "conststack" do
  version "1.1.0"
  sha256 "205defbde240cab31772cb7edeba165f8838a016165afc228f6c75ee47e3b942"

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
