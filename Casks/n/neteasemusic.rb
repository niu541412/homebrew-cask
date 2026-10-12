cask "neteasemusic" do
  arch arm: "_arm64"
  livecheck_arch = on_arch_conditional arm: "arm64", intel: "x64"

  on_arm do
    version "3.1.13,3451"
    sha256 "174dd785bec770ce1451a8bbef56cc2b89bda9df8e9be2ba2d46e4bc893fec84"
  end
  on_intel do
    version "3.1.9,3364"
    sha256 "6e117a5db6957650fff187cd6c8a3970d8784685ee72ec1cb97f957b46d4d5f7"
  end

  url "https://d1.music.126.net/dmusic/NeteaseCloudMusic_Music_official_#{version.csv.join(".")}#{arch}.dmg",
      user_agent: :fake
  name "NetEase cloud music"
  name "网易云音乐"
  desc "Music streaming platform"
  homepage "https://music.163.com/"

  livecheck do
    url "https://music.163.com/api/mac/package/download/latest?arch=#{livecheck_arch}&productName=music"
    strategy :json do |json|
      version = json.dig("data", "appVer")
      build = json.dig("data", "buildVer")
      next if version.blank? || build.blank?

      "#{version},#{build}"
    end
  end

  auto_updates true
  depends_on :macos

  app "NeteaseMusic.app"

  uninstall quit: "com.netease.163music"

  zap trash: [
    "~/Library/Application Support/com.netease.163music",
    "~/Library/Caches/com.netease.163music",
    "~/Library/Containers/com.netease.163music",
    "~/Library/Cookies/com.netease.163music.binarycookies",
    "~/Library/HTTPStorages/com.netease.163music",
    "~/Library/Preferences/com.netease.163music.plist",
    "~/Library/Saved Application State/com.netease.163music.savedState",
    "~/Library/WebKit/com.netease.163music",
  ]
end
