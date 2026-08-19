cask "conststack" do
  version "1.0.0"
  sha256 "5961e34cc51b59df8b133990411a4eb789bcd0b140b833c00834fe00201b4d0b"

  url "https://github.com/ArmanKT/ConstStack-releases/raw/main/ConstStack-macOS-v#{version}.dmg"
  name "ConstStack"
  desc "Ultra-Fast, Zero-Config Local Web Development Environment for macOS"
  homepage "https://constmind.com"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "ConstStack.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/ConstStack.app"],
                   sudo: false
  end

  zap trash: [
    "~/.const_stack",
    "~/Library/Application Support/ConstStack",
    "~/Library/Preferences/com.constmind.conststack.plist",
    "~/Library/Logs/ConstStack",
  ]
end
