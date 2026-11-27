# Updated automatically by the release workflow of https://github.com/lukasz-stec/edit
cask "edit" do
  version "0.1.18"
  sha256 "d5c14c8cc3892c69ecc036be36e21355fcccffd3e489b57d95eb544a7ce7f76c"

  url "https://github.com/lukasz-stec/edit/releases/download/v#{version}/edit-macos-universal.zip"
  name "Edit"
  desc "Fast native text editor with IntelliJ-style editing"
  homepage "https://github.com/lukasz-stec/edit"

  depends_on macos: ">= :big_sur"

  app "Edit.app"

  # The app isn't notarized: clear the quarantine flag so Gatekeeper lets it open.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Edit.app"]
  end

  zap trash: "~/Library/Application Support/edit"
end
