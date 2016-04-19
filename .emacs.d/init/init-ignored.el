(require 'projectile)

(defcustom my-ignored-directories (list ".git" ".svn" ".hg" "GeneratedFiles" "buildpdb" "lib" "sln" "log" "bin" "build" "build32" "build64" "build-x64" "build-x86" "build-64" "build-32" "build-vc11" "build-vc11-32" "build-vc11-64" "build-vc11-x86" "build-vc11-x64" ".backups" "debug" "release" "google")
  "my-ignored-directories"
  :type 'list
  :group 'my-ignored)

(defcustom my-ignored-files (list "GPATH" "GRTAGS" "GTAGS" "TAGS" ".*" ".css" "*.log" "*.db" "#*#" "*~*" "*.exe" "*.png" "*.jpg" "*.bmp" "*.filters" "*.user" "*.gif" "*.pdb" "*.dll" "*.pb.cc" "*.pb.h" "*.zip" "*.rar" "*vcxproj" "*vcxproj.filters" "*.vcxproj.user")
  "my-ignored-files"
  :type 'list
  :group 'my-ignored)

(customize-set-variable 'projectile-globally-ignored-directories my-ignored-directories)
(customize-set-variable 'projectile-globally-ignored-files my-ignored-files)

(customize-set-variable 'grep-find-ignored-directories my-ignored-directories)
(customize-set-variable 'grep-find-ignored-files my-ignored-files)

(provide 'init-ignored)

