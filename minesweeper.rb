class Minesweeper < Formula
  desc "Vim-friendly Minesweeper TUI"
  homepage "https://github.com/Pansther/minesweeper-tui"
	version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
		url "https://github.com/Pansther/minesweeper-tui/releases/download/v0.3.0/minesweeper-tui-darwin-x64.tar.gz"
    sha256 "30ab45ff0ea23efe8f4601aa99851713103d7f4fdadd7454e8d0fe4e4444f65a"
  elsif OS.mac? && Hardware::CPU.arm?
		url "https://github.com/Pansther/minesweeper-tui/releases/download/v0.3.0/minesweeper-tui-darwin-arm64.tar.gz"
    sha256 "e8547f3a05f165b314222e26a1536e74209aa8c9708b1a7d1e6744cbfa8ef319"
  elsif OS.linux? && Hardware::CPU.intel?
		url "https://github.com/Pansther/minesweeper-tui/releases/download/v0.3.0/minesweeper-tui-linux-x64.tar.gz"
    sha256 "5eb75032323ddcbb6255c283ba01c2e1468ec815e5590331e3439e52bf91c422"
  elsif OS.linux? && Hardware::CPU.arm?
		url "https://github.com/Pansther/minesweeper-tui/releases/download/v0.3.0/minesweeper-tui-linux-arm64.tar.gz"
    sha256 "5680ebbb656cd301ba1347b6746a5385127071a547d5332e7299a0e76ae220f2"
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "minesweeper-tui-darwin-arm64" : "minesweeper-tui-darwin-x64"
    elsif Hardware::CPU.arm?
      "minesweeper-tui-linux-arm64"
    else
      "minesweeper-tui-linux-x64"
    end

    bin.install binary_name => "minesweeper"
  end

  test do
		assert_match "0.3.0", shell_output("#{bin}/minesweeper --version")
  end
end
