cask "brewui" do
  version "0.1.5"
  sha256 "9585bbe9a4942a526615108a2250b7ac4234fb724b05bb055fc6eb0e60db509d"

  url "https://github.com/nishantapatil3/brewUI/releases/download/v#{version}/brewUI.app.zip"
  name "brewUI"
  desc "Lightweight native Swift UI for Homebrew package management"
  homepage "https://github.com/nishantapatil3/brewUI"

  app "brewUI.app"
end
