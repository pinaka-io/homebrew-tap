cask "brewui" do
  version "0.1.2"
  sha256 "e28b8b2a24929269b723130e0e567d84d95795ab714f303247e3d23e3bc44442"

  url "https://github.com/nishantapatil3/brewUI/releases/download/v#{version}/brewUI.app.zip"
  name "brewUI"
  desc "Lightweight native Swift UI for Homebrew package management"
  homepage "https://github.com/nishantapatil3/brewUI"

  app "brewUI.app"
end
