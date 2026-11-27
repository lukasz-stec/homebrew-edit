# Updated automatically by the release workflow of https://github.com/lukasz-stec/edit
cask "edit" do
  version "0.1.19"
  sha256 "922e765d8c2e8ccc0a030163f160aee0aff0977e79aa6c95ea0fe54d7731eb0a"

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
