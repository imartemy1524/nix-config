{ ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "dracula";

      editor = {
        indent-guides.render = true;

        bufferline = "always";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        color-modes = true;
        auto-save = true;

        lsp.display-messages = true;
      };
    };
  };
}
