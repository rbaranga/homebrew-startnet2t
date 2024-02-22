# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Starnet2t < Formula
  desc "This version of StarNet2 uses Torch and OpenCV instead of Tensorflow and LibTIFF. This required me to switch libraries around, but brought more possibilities. This version of the CLI tool has been fully reworked and supports many formats of image files as input and output, outputs mask, has an option for intermediate 2x upsampling. At this point the only difference between CLI and PI plugin is support for linear images (which depends on PI’s STF and can not be reproduced outside of PI at the moment).
  This version contains signed binaries (so there should be no problems installing it) and should be blazingly fast on M1 CPUs!"
  homepage "https://www.starnetastro.com/experimental/"
  url "https://www.starnetastro.com/wp-content/uploads/2023/02/StarNet2T_MacOS.zip"
  version "0.0.1"
  sha256 "d566cd0a59d15894a3b027354812707b4408ca0917275af36602520f4ddec918"
  license "public_domain"

  depends_on :macos
  depends_on "opencv"
  depends_on "pytorch"

  def install
    chmod 0755, "starnet2"
    libexec.install "starnet2"
    share.install "StarNet2_weights.pt"
  end

  test do
    output = shell_output("#{bin}/starnet2 -h")
    assert_match "StarNet2", output
  end
end
