# Homebrew cask for the exact signed, stapled Cliphoard 1.0.4 build 37 ZIP.
# Publish only after the public archive checksum has been verified.
cask "cliphoard" do
  version "1.0.4,37"
  sha256 "39f45805a05b5d786866f515923af834e636ab957c30855d3fc7c6c4e198486b"

  # Refuse a placeholder checksum.
  if sha256.to_s == "0000000000000000000000000000000000000000000000000000000000000000" &&
     !Homebrew::EnvConfig.developer?
    odie "Casks/cliphoard.rb still has the all-zero placeholder sha256 — fill in the " \
         "released archive's sha256 (see RELEASING.md) before publishing."
  end

  url "https://github.com/AntreasAntoniou/cliphoard/releases/download/direct-v1.0.4-build37/Cliphoard-1.0.4-Direct-build37.zip"
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
