{
  programs.git = {
    enable = true;
    includes = [
      {
        contents = {
          user = {
            email = "hello@arisc.how";
            name = "Aris Chow";
          };
        };
      }
      {
        condition = "gitdir:~/Work/repos/Mintel/";
        contents = {
          user = {
            email = "azhou@mintel.com";
            name = "Aris Zhou";
          };
        };
      }
    ];
  };
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };
}
