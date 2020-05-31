cask 'devonthink' do
  version '3.5'
  sha256 '222e77551763f6c98d87bdf99c30663af7e886e52f988fb31be1c9c9f1103fa5'

  url "https://download.devontechnologies.com/download/devonthink/#{version}/DEVONthink_#{version.major}.app.zip"
  appcast 'https://api.devontechnologies.com/1/apps/sparkle/sparkle.php?id=300900000'
  name 'DEVONthink'
  homepage 'https://www.devontechnologies.com/apps/devonthink/'

  auto_updates true

  app "DEVONthink #{version.major}.app"

  zap trash: [
               '~/Library/Application Scripts/com.devon-technologies.*',
               '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.devon-technologies.think*.sfl2',
               '~/Library/Application Support/DEVONthink*',
               '~/Library/Caches/com.apple.helpd/Generated/com.devontechnologies.devonthink.help*',
               '~/Library/Caches/com.devon-technologies.think*',
               '~/Library/Containers/com.devon-technologies.*',
               '~/Library/Cookies/com.devon-technologies.think*.binarycookies',
               '~/Library/Group Containers/679S2QUWR8.think*',
               '~/Library/Metadata/com.devon-technologies.think*',
               '~/Library/Preferences/com.devon-technologies.think*',
               '~/Library/Saved Application State/com.devon-technologies.think*.savedState',
               '~/Library/Scripts/Applications/DEVONagent',
               '~/Library/Scripts/Folder Action Scripts/DEVONthink*',
               '~/Library/WebKit/com.devon-technologies.think*',
             ]
end
