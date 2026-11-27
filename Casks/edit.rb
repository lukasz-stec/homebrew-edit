# Updated automatically by the release workflow of https://github.com/lukasz-stec/edit
cask "edit" do
  version "0.1.20"
  sha256 "b3650773a4adad61767cf1e96cc5d28912320c27a71055bf75d94cafe9d2bd76"

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
