{
  programs.git = {
    enable = true;
    userEmail = "hello@arisc.how";
    userName = "Aris Chow";
    includes = [
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
  programs.git.diff-so-fancy = {
    enable = true;
  };
}
