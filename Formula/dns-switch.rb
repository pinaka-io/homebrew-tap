class DnsSwitch < Formula
  desc "Fast, user-friendly TUI for quickly switching between DNS configurations"
  homepage "https://github.com/pinaka-io/dns-switch"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.1/dns-switch-darwin-arm64.tar.gz"
      sha256 "fc528f1e64a7364b57f33a963420e7d928c8af468b3c3f4d5f4a7197bbcbe0af"
    else
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.1/dns-switch-darwin-amd64.tar.gz"
      sha256 "d41fffa068ab814350992268d122ab58336ad715ccf28d73ca2ecc1bdfb6e101"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.1/dns-switch-linux-arm64.tar.gz"
      sha256 "13290b362574bfb75f9d82ac53381a9972e410c0fe29259f574d5cb18ff77d55"
    else
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.1/dns-switch-linux-amd64.tar.gz"
      sha256 "1f5ba842d060d605d21c0b9284a448586b8878043be9a989122770a0d81ec061"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "dns-switch-darwin-arm64" => "dns-switch"
      else
        bin.install "dns-switch-darwin-amd64" => "dns-switch"
      end
    else
      if Hardware::CPU.arm?
        bin.install "dns-switch-linux-arm64" => "dns-switch"
      else
        bin.install "dns-switch-linux-amd64" => "dns-switch"
      end
    end
  end

  def caveats
    <<~EOS
      DNS Switch requires sudo to modify network settings:
        sudo dns-switch

      Configuration file location:
        ~/.config/dns-switch/config.yaml
    EOS
  end

  test do
    assert_match "dns-switch", shell_output("#{bin}/dns-switch --version")
  end
end
