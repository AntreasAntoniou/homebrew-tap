# Homebrew cask for the exact signed, stapled Cliphoard 1.0.4 build 38 ZIP.
# Publish only after the public archive checksum has been verified.
cask "cliphoard" do
  version "1.0.4,38"
  sha256 "a446a267e7ba6cd4470bb7888e7bff8774db3681d35c85cd93b199d6994db5a4"

  # Refuse a placeholder checksum.
  if sha256.to_s == "0000000000000000000000000000000000000000000000000000000000000000" &&
     !Homebrew::EnvConfig.developer?
    odie "Casks/cliphoard.rb still has the all-zero placeholder sha256 — fill in the " \
         "released archive's sha256 (see RELEASING.md) before publishing."
  end

  url "https://github.com/AntreasAntoniou/cliphoard/releases/download/direct-v1.0.4-build38/Cliphoard-1.0.4-Direct-build38.zip"
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
