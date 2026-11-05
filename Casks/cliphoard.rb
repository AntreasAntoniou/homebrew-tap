# Homebrew Cask for Cliphoard.
#
# The checksum identifies the exact signed and notarized build22 ZIP
# published on GitHub and verified by an anonymous full-byte download.
# Scripts/publish-cask.sh checks the public download before copying this cask
# into a tap; the Ruby guard also refuses an all-zero placeholder.
# A cask in this source repository does not establish a published Homebrew tap.
cask "cliphoard" do
  version "1.0.3"
  sha256 "34d8b6cd75511024fc7aea542dad6a774eb3af1b255193f2d67b07d980b7fd35"

  # Belt-and-braces: refuse to install/audit a cask that still carries the
  # all-zero placeholder sha256. Gated to non-development runs so `--debug`/local
  # cask editing is unaffected; the publish-time download check lives in
  # Scripts/publish-cask.sh. Kept side-effect-free so `ruby -c` / `brew` parsing pass.
  if sha256.to_s == "0000000000000000000000000000000000000000000000000000000000000000" &&
     !Homebrew::EnvConfig.developer?
    odie "Casks/cliphoard.rb still has the all-zero placeholder sha256 — fill in the " \
         "released archive's sha256 (see RELEASING.md) before publishing."
  end

  url "https://github.com/AntreasAntoniou/cliphoard/releases/download/v1.0.3-direct-build22/Cliphoard-1.0.3-Direct-build22.zip"
  name "Cliphoard"
  desc "Fast, private clipboard manager with on-device semantic search"
  homepage "https://github.com/AntreasAntoniou/cliphoard"

  depends_on macos: :ventura

  app "Cliphoard.app"

  uninstall quit: ["ai.a2-labs.cliphoard", "io.antreas.cliphoard"]

  zap trash: [
    "~/Library/Application Support/Ditto",
    "~/Library/Preferences/ai.a2-labs.cliphoard.plist",
    "~/Library/Preferences/io.antreas.cliphoard.plist",
  ]
end
