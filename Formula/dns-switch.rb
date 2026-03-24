class DnsSwitch < Formula
  include Language::Python::Virtualenv

  desc "User-friendly TUI for quickly switching between DNS configurations"
  homepage "https://github.com/pinaka-io/dns-switch"
  url "https://github.com/pinaka-io/dns-switch/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "06fa83fed21d4259c64629235d093bedc80e1e6d80978f1ea1f1a4eeaeae789f"
  license "MIT"

  depends_on "python@3.11"

  resource "textual" do
    url "https://files.pythonhosted.org/packages/source/t/textual/textual-0.50.1.tar.gz"
    sha256 "415bef44b2dfa702d17ebb08637c0141eb54767cfbeafe60d07e62104183b56a"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/source/P/PyYAML/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  def install
    virtualenv_install_with_resources

    # Install default config to share directory
    (share/"dns-switch").install "config.yaml"
  end

  def caveats
    <<~EOS
      DNS Switch requires sudo to modify network settings.
      Run with: sudo dns-switch

      Configuration file: create ~/.config/dns-switch/config.yaml
      Example config: #{share}/dns-switch/config.yaml

      Copy the example config:
        mkdir -p ~/.config/dns-switch
        cp #{share}/dns-switch/config.yaml ~/.config/dns-switch/

      You can edit this file to add your own DNS profiles.
    EOS
  end

  test do
    assert_match "DNS Switch", shell_output("#{bin}/dns-switch --help 2>&1", 2)
  end
end
