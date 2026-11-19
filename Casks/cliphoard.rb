# Homebrew cask for the exact signed, stapled Cliphoard 1.0.4 build 46 ZIP.
# Publish only after the public archive checksum has been verified.
cask "cliphoard" do
  version "1.0.4,46"
  sha256 "d5e0086722955cc913baf63b354a552afcf94eb8aceef2a563e04c3f42461d7f"

  # Refuse a placeholder checksum.
  if sha256.to_s == "0000000000000000000000000000000000000000000000000000000000000000" &&
     !Homebrew::EnvConfig.developer?
    odie "Casks/cliphoard.rb still has the all-zero placeholder sha256 — fill in the " \
         "released archive's sha256 (see RELEASING.md) before publishing."
  end

  url "https://github.com/AntreasAntoniou/cliphoard/releases/download/direct-v1.0.4-build46/Cliphoard-1.0.4-Direct-build46.zip"
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
