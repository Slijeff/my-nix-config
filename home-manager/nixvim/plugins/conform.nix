{
  programs.nixvim.plugins.conform-nvim= {
    enable = true;
    formatters_by_ft = {
      yaml = ["yamlfmt"];
    };
  };
}
