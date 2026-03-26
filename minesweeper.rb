class MinesweeperTui < Formula
  desc "MineSweeper TUI"
  homepage "https://github.com/Pansther/minesweeper-tui"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Pansther/minesweeper-tui/releases/download/v0.1.0/minesweeper-tui-darwin-x64.tar.gz"
    sha256 "fb4c1a7ccf09b35c1a226ef353294a55a429fc72d0497005956a90b84090957c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Pansther/minesweeper-tui/releases/download/v0.1.0/minesweeper-tui-darwin-arm64.tar.gz"
    sha256 "1bfa33370ccdb8dbcae66c906baaae695f4aed83a76891b39ffe277dad8e82fb"
  elsif OS.linux?
    url "https://github.com/Pansther/minesweeper-tui/releases/download/v0.1.0/minesweeper-tui-linux-x64.tar.gz"
    sha256 "679292892f6008ee570deecd937f4f35f8d78c2eec619b56a66c239c9b6e118c"
  end

def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "minesweeper-tui-darwin-x64" => "minesweeper-tui"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "minesweeper-tui-darwin-arm64" => "minesweeper-tui"
    elsif OS.linux?
      bin.install "minesweeper-tui-linux-x64" => "minesweeper-tui"
    end
  end
  test do
    system "#{bin}/minesweeper", "--version"
  end
end
