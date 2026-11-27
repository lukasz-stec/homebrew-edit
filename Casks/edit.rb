# Updated automatically by the release workflow of https://github.com/lukasz-stec/edit
cask "edit" do
  version "0.1.21"
  sha256 "433a122f263965772e5a721468977b3ebb67561a7fd398d338ce9be20e3f5164"

  url "https://github.com/lukasz-stec/edit/releases/download/v#{version}/edit-macos-universal.zip"
  name "Edit"
  desc "Fast native text editor with IntelliJ-style editing"
  homepage "https://github.com/lukasz-stec/edit"

  depends_on macos: :big_sur

  app "Edit.app"

  # The app isn't notarized: clear the quarantine flag so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Edit.app"],
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/edit"
end
