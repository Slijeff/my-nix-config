{
  # Collection of various small independent plugins/modules
  # https://nix-community.github.io/nixvim/plugins/mini.html
  programs.nixvim.plugins.mini = {
    enable = true;

    modules = {
      # Better Around/Inside textobjects
      #
      # Examples:
      #  - va)  - [V]isually select [A]round [)]paren
      #  - yinq - [Y]ank [I]nside [N]ext [']quote
      #  - ci'  - [C]hange [I]nside [']quote
      ai = {
        n_lines = 500;
      };

      # Add/delete/replace surroundings (brackets, quotes, etc.)
      #
      # Examples:
      #  - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      #  - sd'   - [S]urround [D]elete [']quotes
      #  - sr)'  - [S]urround [R]eplace [)] [']
      # surround = {
      # };

      trailspace = {
      };

      # smooth scrolling and smooth mouse
      animate = {};

      cursorword = {};
    };
  };
}
