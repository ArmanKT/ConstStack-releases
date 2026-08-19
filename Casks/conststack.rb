cask "conststack" do
  version "1.1.0"
  sha256 "444f03382fb1f99146dfbc04dfd071d4ccda577d4bc8ae9c5cca43a3435e5b72"

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
