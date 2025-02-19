cask "shutter-encoder" do
  arch arm: "Apple Silicon", intel: "Mac 64bits"

  version "17.6"
  sha256 arm:   "89d93aa68bec81821e6bac6aad579a21c08934431a2eb89285eca8ba68943639",
         intel: "17e327e9305e335c8bdd45f20892ef7c9df23cc6b75171943d121766f3cf9b7b"

  url "https://www.shutterencoder.com/Shutter%20Encoder%20#{version}%20#{arch.gsub(" ", "%20")}.pkg"
  name "Shutter Encoder"
  desc "Video, audio and image converter"
  homepage "https://www.shutterencoder.com/"

  livecheck do
    url "https://www.shutterencoder.com/changelog.txt"
    regex(/^\s*Version\s*(\d+(?:\.\d+)+)/i)
  end

  pkg "Shutter Encoder #{version} #{arch}.pkg"

  uninstall launchctl: "application.com.paulpacifico.shutterencoder.*",
            pkgutil:   "com.paulpacifico.shutterencoder",
            quit:      "com.paulpacifico.shutterencoder"

  zap trash: "~/Documents/Shutter Encoder"
end
