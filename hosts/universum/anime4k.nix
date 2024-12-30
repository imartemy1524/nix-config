{ pkgs, ... }:

let
  anime4k = pkgs.fetchFromGitHub {
    owner = "bloc97";
    repo = "Anime4K";
    rev = "v4.0.1"; # Specify the desired version
    sha256 = "sha256-08mj9qfd1ad2nbfs2l9wv95jzs5r17n4fbl3nk1cbscg7bmq2xwy"; # Replace with actual hash
  };
in
{
  home.file.".config/mpv/mpv.conf".text = ''
    # Anime4K configuration
    glsl-shaders="${anime4k}/glsl/Anime4K_Upscale_Denoise.glsl"
    # Add more shaders if needed
  '';
}
