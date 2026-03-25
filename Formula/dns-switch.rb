class DnsSwitch < Formula
  desc "Fast, user-friendly TUI for quickly switching between DNS configurations"
  homepage "https://github.com/pinaka-io/dns-switch"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.0/dns-switch-darwin-arm64.tar.gz"
      sha256 "81615c2f214dcbfd92c6c2d0d0a77933dec62c5f450998dd05fc28eced1f19ca"
    else
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.0/dns-switch-darwin-amd64.tar.gz"
      sha256 "35b721e58e91554ac8ea97be32a7e44aa63096d7043f618e7eecfee24fbf230f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.0/dns-switch-linux-arm64.tar.gz"
      sha256 "0eb0541f09c7f20510e5091c9ae9cb62ae1287bd5209a834c02f197374c74c1d"
    else
      url "https://github.com/pinaka-io/dns-switch/releases/download/v1.0.0/dns-switch-linux-amd64.tar.gz"
      sha256 "0cea9b9449a4965c665a08e1368f3f48daf99d1e71c2228d5ec87a63eb9474ea"
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
