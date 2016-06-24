# emacs
my emacs config.

my key guick guide.
* 帮助
| C-h w               | where-is             | 查看命令菜单位置或者绑定热键 |
| C-h t               | help-with-tutorial   | 查看?Emacs??教程             |
| C-h n               | view-emacs-news      | 浏览?Emacs??新闻             |
| C-h m               | describe-mode        | 查看编辑模式                 |
| C-h ?               | help-for-help        | 查看帮助列表                 |
| C-h k?<??命令序列?> | describe-key         | 查看热键详细功能描述         |
| C-h c?<??命令序列?> | describe-key-briefly | 查看热键简单功能描述         |
| C-h b               | describe-bindings    | 查看绑定热键                 |
| C-h C-c             |                      | 查看许可证信息               |
| C-h i               |                      | 查看在线手册                 |
					
* 基本
| M-g g               | Goto-line                | 跳到指定行                         |
| C-\                 | goto-last-change         | 跳到最后编辑处，跳转编辑历史       |
| C-a                 | beginning-of-line        | 移动到行首                         |
| C-e                 | end-of-line              | 移动到行尾                         |
| C-b                 | backward-char            | 向前移动一个字符                   |
| C-f                 | forward-char             | 向后移动一个字符                   |
| C-x <               | scroll-left              | 向左移动一屏                       |
| C-x >               | scroll-right             | 向右移动一屏                       |
| M-a                 |                          | 移动到块首                         |
| M-e                 |                          | 移动到块尾                         |
| C-k                 | kill-line                | 删除一行                           |
| C-o                 | open-line                | 增加一行                           |
| C-p                 | previous-line            | 向上移动一行                       |
| C-n                 | next-line                | 移动到下一行                       |
| C-v                 | scroll-up                | 向下滚动一屏                       |
| M-v                 | scroll-down              | 向上滚动一屏                       |
| C-M-v               | scroll-other-window      | 其他窗口向上滚动一屏               |
| C-M-V               | scroll-other-window-down | 其他窗口向下滚动一屏               |
| C-l                 | recenter                 | 刷新显示，使光标所在行变为屏幕中央 |
| C-_ or C-/ or C-x u | undo                     | 撤销                               |
| C-?                 | redo                     | 恢复                               |
| TAB                 | forward-button           | 缩进                               |
| C-d                 | delete-char              | 删除一个字符                       |
| C-g                 | keyboard-quit            | 终止当前操作                       |
| C-x C-x             | exchange-point-and-mark  | 区域的起点改在光标所在处           |
| C-x C-u             | upcase-region            | 选定区域字母改成大写               |
| C-x C-l             | downcase-region          | 选定区域字母改成小写               |
| M-/                 | dabbrev-expand           | 自动补齐（缓冲区中能找得到的串）   |
| C-x n n             | narrow-to-region         | 暂时隐藏未选中区域                 |
| C-x n w             | widen                    | 显示隐藏的区域                     |
| M-up                | move-text-up             | 向上移动选中区域                   |
| M-down              | move-text-down           | 向下移动选中区域                   |
| C-M-left/right      | forward/backward-sexp    | skip to match parentheses          |
					
* 标记
| C-@     | set-mark-command  | 设置标记       |
| C-w     | kill-region       | 剪切选定区域   |
| M-w     | kill-ring-save    | 复制选定区域   |
| C-y     | yank              | 粘贴           |
| C-y M-y |                   | 切换kill ring  |
| C-x C-p | mark-page         | 全选当前页     |
| C-x h   | mark-whole-buffer | 全选当前buffer |
					
* 文件
| C-x C-f | find-file                      | 打开文件                            |
|         | find-file-read-only            | 只读方式打开文件                    |
|         | find-file-literally            | 简易打开文件，无mode                |
|         | ffap                           | 打开光标所在处的文件                |
| C-c p h | helm-projectile-find-file      | Helm interface to projectile        |
| C-c p g | helm-projectile-find-file-dwim | Find file based on context at point |
| C-x C-r | recentf-open-files             | 打开最近文件                        |
| C-x C-s | save-buffer                    | 保存当前缓冲区                      |
| C-x C-w | write-file                     | 另存当前缓冲区                      |
| C-x C-v | find-alternate-file            | 打开另外一个文件，关闭缓冲区        |
| C-x s   | save-some-buffers              | 保存多个文件（保存所有?buffer?）    |
| C-x i   | insert-file                    | 插入文件                            |
| C-x C-q |                                | 切换当前缓冲只读?/?可写             |
					
* 目录
| C-x C-d | list-directory | 列出当前目录（简要） |
| C-x d   | dired          | 列出当前目录（详细） |
					
* Buffer
| M-<                   |                  | 跳到缓冲头部                       |
| M->                   |                  | 跳到缓冲尾部                       |
| C-x <left> or <right> |                  | 前后?buffer                        |
| C-x C-b               |                  | 缓冲列表（详细）                   |
| C-x b                 | list-buffers     | 缓冲列表（简要）                   |
| C-x l                 | count-lines-page | 计算当前缓冲区行数                 |
| C-x k                 | kill-buffer      | 关闭缓冲区                         |
| C-x C-q               |                  | 切换当前缓冲只读/可写              |
| C-l                   | recenter         | 刷新显示，使光标所在行变为屏幕中央 |
					
* 窗口
| C-x 0                  | delete-window             | 关闭当前窗口               |
| C-x 1                  | delete-other-windows      | 保留当前窗口，关闭其他窗口 |
| C-x 2                  | split-window-vertically   | 水平分割窗口               |
| C-x 3                  | split-window-horizontally | 垂直分割窗口               |
| C-x 4 u or C-c <left>  | winner-undo               | 恢复上一个窗口布局         |
| C-x 4 r or C-c <right> | winner-redo               | 重复上一个窗口布局         |
| C-x C-z                | zoom-window-zoom          | 最大化（恢复）当前窗口     |
| ESC ESC ESC            | keyboard-escape-quit      | 保留当前窗口，关闭其他窗口 |
| C-x o                  | other-window              | 跳转到另一个窗口           |
| M-num                  | select-window-num         | 跳转到标号是num的窗口      |
|                        | rotate-windows            | 循环窗口                   |
					
* 程序（系统）
| C-g     | keyboard-quit       | 终止当前操作          |
| C-z     | suspend-frame       | emacs放入后台(window) |
| C-x C-z | suspend-frame       | emacs放入后台(linux)  |
|         | eval-current-buffer | 使.emacs立即生效      |
| C-x C-e | eval-last-sexp      |                       |
					
* 版本控制
** ediff
|   | ediff-buffers | 询问两个缓冲区的名字，然后比较       |
|   | ediff-files   | 询问两个文件的名字，加载之，然后比较 |
*** 在 control buffer 中，按键
| q              | ediff-quit                        | 关闭 ediff control buffer， 并退出 ediff                         |
| Space 或 n     | ediff-next-difference             | 下一个差异处                                                     |
| Del 或 p       | ediff-previous-difference         | 上一个差异处                                                     |
| [n]j           | ediff-jump-to-difference          | "有数字前缀 [n] 修饰，第n个差异处,n可为负数                      |
| v 或 C-v       | ediff-scroll-vertically           | 所有缓冲区同步向下滚动                                           |
| V 或 M-v       | ediff-scroll-vertically           | 所有缓冲区同步向上滚动                                           |
| <              | ediff-scroll-horizontally         | 所有缓冲区同步向左滚动                                           |
| >              | ediff-scroll-horizontally         | 所有缓冲区同步向右滚动                                           |
| (vertical bar) | ediff-toggle-split                | "切换缓冲区布局方式, 水平和竖直                                  |
| m              | ediff-toggle-wide-display         | 在正常 frame 大小和最大化之间切换                                |
| a              | ediff-copy-A-to-B                 | 把Buffer-A的内容复制到Buffer-B                                   |
| b              | ediff-copy-B-to-A                 | 把Buffer-B的内容复制到Buffer-A                                   |
| r a 或 r b     | ediff-restore-diff                | 恢复 Buffer-A 或 Buffer-B 差异区域中的被修改的内容               |
| A 或 B         | ediff-toggle-read-only            | 切换 Buffer-A 或 Buffer-B 的只读状态                             |
| g a 或 g b     | ediff-jump-to-difference-at-point | 根据光标在缓冲区中的位置，设置一个离它们最近的差异区域为当前活动 |
| C-l            | ediff-recenter                    | 恢复先前的所有缓冲区比较的高亮差异区。                           |
| !              | ediff-update-diffs                | 重新比较并高亮差异区域                                           |
| w a 或 w b     | ediff-save-buffer                 | 保存 Buffer-A 或 Buffer-B 到磁盘                                 |
| E              | ediff-documentation               | 打开 Ediff 文档                                                  |
| z              | ediff-suspend                     | "关闭 ediff control buffer, 只是挂起，可在以后恢复 ediff 状态    |
					
** git
1. git中除了第一次外，不提示输入密码：git config --global credential.helper store					
2. git config user.email "xxx@xxx.com"					
3. git config user.name "xxx"
   git通过ui来请求密码：(setenv "GIT_ASKPASS" "git-gui--askpass")
** magit
|   | magit-status | switch to the status buffer of that repository 使用这个命令查看Git的状态，在git中的命令为git status                       |
|   | s            | to stage files 把untracked或者unstaged文件的状态改成stage模式                                                             |
|   | c            | to commit (type in your commit message then C-c C-c to save the message and commit)  把所有staged文件都commit到索引仓库中 |
|   | P            | to do a git push Update remote refs along with associated objects                                                         |
|   | F            | to do a git pull Fetch from and merge with another repository or a local branch                                           |
|   | TAB          | Toggle hidden status of current section 用来转换显示当前文件的一些信息                                                    |
|   | i            | ignore file this will add the filename to the .gitignore file. 忽略当前文件的版本控制，如一些临时文件                     |
|   | I            | ignore file this will add the file to .git/infor/exclude                                                                  |
|   | C-h m        | Magit的使用帮助信息                                                                                                       |
					
** vc
| C-x v d | vc-directory         | 列出目录下修改过的文件 |
| C-x v l | vc-print-log         | 显示改动历史记录       |
| C-x v h | vc-insert-headers    | 插入版本控制信息       |
| C-x v v | vc-next-action       | 进入提交改动状态       |
| C-x v = | vc-diff              | 显示改动               |
| C-x v i | vc-register          | 加入文件到版本控制中   |
| C-x v r | vc-retrieve-snapshot | 取某一版本文件         |
					
** project（ile）
| C-c p C-h     |                                  | projectile help                                                                                         |
| C-c p f       |                                  | Display a list of all files in the project. With a prefix argument it will clear the cache first.       |
| C-c p d       |                                  | Display a list of all directories in the project. With a prefix argument it will clear the cache first. |
| C-c p s g     |                                  | Run grep on the files in the project.                                                                   |
| M-- C-c p s g |                                  | Run grep on?projectile-grep-default-files?in the project.                                               |
| C-c p v       |                                  | Run?vc-dir?on the root directory of the project.                                                        |
| C-c p b       |                                  | Display a list of all project buffers currently open.                                                   |
| C-c p a       |                                  | Switch between files with the same name but different extensions.                                       |
| C-c p o       |                                  | Runs?multi-occur?on all project buffers currently open.                                                 |
| C-c p r       |                                  | Runs interactive query-replace on all files in the projects.                                            |
| C-c p e       |                                  | Shows a list of recently visited project files.                                                         |
| C-c p h       | helm-projectile                  | Helm interface to projectile                                                                            |
|               | helm-projectile-switch-to-buffer |                                                                                                         |
|               | helm-projectile-find-file        |                                                                                                         |
|               | helm-projectile-switch-project   |                                                                                                         |
| C-c p g       | helm-projectile-find-file-dwim   | Find file based on context at point                                                                     |
					
* 查找
** 普通（isearch）
| C-r | isearch-backward-regexp | 向前查找（进入查找模式）                     |
| C-s | isearch-forward-regexp  | 向后查找（进入查找模式）                     |
|     | C-w                     | （查找模式时）把光标所在的单词作为查找对象   |
|     | C-g                     | （查找模式时）中断搜索，返回开始搜索的起点位 |
|     | M-c                     | （查找模式时）切换大小写敏感                 |
|     | M-e                     | （查找模式时）编辑要查找的内容               |
|     | M-n or?M-p              | （查找模式时）浏览查找历史纪录               |
** moccur
| M-o |   | （查找模式时）列出当前buffer内所有查找内容         |
| M-O |   | （查找模式时）列出所有打开的buffer内出现的查找内容 |
** ace
| M-r     | isearch-backward                | 向前查找（一秒内只输入一个字母进入ace模式，否则进入isearch模式，超过3个字母进入swoop模式） |
| M-s     | isearch-forward                 | 向后查找一秒内只输入一个字母进入ace模式，否则进入isearch模式，超过3个字母进入swoop模式）   |
| C-'     | ace-isearch-jump-during-isearch |                                                                                            |
| C-c SPC | ace-jump-mode                   |                                                                                            |
					
* 替换
| M-% | query-replace  | 查询替换                                         |
|     | SPACE或y       | 用新字符串替换原来的，并进入下一个位置           |
|     | DEL或n         | 不替换，进入下一个位置                           |
|     | .              | 在当前位置做替换后退出查询－替换操作             |
|     | ","            | 替换，并显示替换情况（再按空格或??y进入下一个位  |
|     | !              | 对后面的内容全部进行替换，不再提问               |
|     | ^              | 返回上一个替换了的位置                           |
|     | RETURN或q      | 退出查询替换操作                                 |
|     | C-r            | 进入递归编辑状态                                 |
|     | C-w            | 删除此处内容并进入递归编辑状态（好进行其他修改） |
|     | M-C-c          | 退出递归编辑状态，继续完成查询－替换操作         |
|     | C-]            | 退出递归编辑状态和查询替换操作                   |
|     | replace-string | 光标向下字符串替换                               |
|     | replace-regexp |                                                  |
					
* 跳回最近位置
| f5 | recent-jump-backward |
| f6 | recent-jump-forward  |
					
* shell
| M-p     |   | 重复上次命令     |
| C-c C-c |   | 中断命令         |
| C-c C-o |   | 清除上次命令结果 |
					
* compile
|           | compile | 编译                                                               |
| C-x `     |         | （出错信息中）下一个错误，一个窗口显示错误信息，另一个显示源码的出 |
| C-u C-x ` |         | 在compile buffer??列出同样的错误。                                 |
| C-c C-c   |         | 转到出错位置                                                       |
					
* debug
|                                              | gdb             | 进入调试         |
| 启动gdb?调试器后，光标在源码文件缓冲区中时： |                 |                  |
|                                              | C-x SPC         | 在当前行设置断点 |
|                                              | C-c C-c         | 中断             |
|                                              | C-c C-z         | 中止             |
|                                              | C-x C-a C-s     | step             |
|                                              | C-x C-a C-n???? | next             |
|                                              | C-x C-a C-t     | tbreak           |
|                                              | C-x C-a C-r     | continue         |
|                                              | C-x C-a C-d     | 删除当前断点     |
|                                              | C-x C-a C-l     | 到达最后一行     |
|                                              | ctrl-d          | 退出调试         |
					
* helm
| M-x         | helm-M-x                         | List commands                                                                                     |
| C-c i       | helm-imenu                       | list function                                                                                     |
| C-c h i     | helm-semantic-or-imenu           | Helm interface to semantic/imenu                                                                  |
| M-y         | helm-show-kill-ring              | Shows the content of the kill ring                                                                |
| C-x b       | helm-mini                        | "Shows open buffers, recently opened files                                                        |
| C-c h o     | helm-occur                       | Similar to occur                                                                                  |
| C-x C-f/C-o | helm-find-files                  | "The helm version for find-file, same as ffap                                                     |
| C-z/C-j/TAB | persistent action                | expand the name when helm-find-files                                                              |
| C-s         | helm-ff-run-grep                 | Run grep from within helm-find-files                                                              |
| C-'         | ace-jump-helm-line               |                                                                                                   |
| M-i         | helm-swoop                       | When doing isearch, hand the word over to helm-swoop.(or:From helm-swoop to helm-multi-swoop-all) |
| M-I         | helm-swoop-back-to-last-point    |                                                                                                   |
| C-r         | helm-previous-line               | in swoop                                                                                          |
| C-s         | helm-next-line                   | in swoop                                                                                          |
| C-c C-e     |                                  | enter the edit mode in swoop                                                                      |
| C-x C-s     |                                  | leave the edit mode in swoop,apply changes to original buffer                                     |
| C-c M-i     | helm-multi-swoop                 |                                                                                                   |
| C-x M-i     | helm-multi-swoop-all             |                                                                                                   |
| C-c p h     | helm-projectile                  | Helm interface to projectile                                                                      |
|             | helm-projectile-switch-to-buffer |                                                                                                   |
|             | helm-projectile-find-file        |                                                                                                   |
|             | helm-projectile-switch-project   |                                                                                                   |
| C-c p g     | helm-projectile-find-file-dwim   | Find file based on context at point                                                               |
| C-x <n>     |                                  | jumps to before the hightlighted line.                                                            |
| C-c <n>     |                                  | jumps to after the highlighted line.                                                              |
					
* 高亮
| f7   | highlight-symbol-at-point | 高亮当前symbol |
| C-f7 | highlight-symbol-next     | 下一个高亮     |
| S-f7 | highlight-symbol-prev     | 上一个高亮     |

* tag
| M-.   | ggtags-find-tag-dwim   | find the tag at point.                                                                                        |
| M-]   | ggtags-find-reference  |                                                                                                               |
| C-M-. | ggtags-find-tag-regexp |                                                                                                               |
| "M-," |                        | find next same name symbol                                                                                    |
| M-*   |                        | go to last postion(press M-. place)                                                                           |
|       | M-n                    | *ggtags-global* buffer，Move to the next match.                                                               |
|       | M-p                    | *ggtags-global* buffer，Move to the previous match.                                                           |
|       | M-}                    | *ggtags-global* buffer，Move to next file.                                                                    |
|       | M-{                    | *ggtags-global* buffer，Move to previous file.                                                                |
|       | M-=                    | *ggtags-global* buffer，Move to the file where navigation session starts.                                     |
|       | M-<                    | *ggtags-global* buffer，Move to the first match.                                                              |
|       | M->                    | *ggtags-global* buffer，Move to the last match.                                                               |
|       | C-M-s or M-s s         | *ggtags-global* buffer，Use isearch to find the match.                                                        |
|       | RET                    | *ggtags-global* buffer，Found the right match so exit navigation mode. Resumable by M-, (tags-loop-continue). |
|       | M-*                    | *ggtags-global* buffer，Abort and go back to the location where the search was started.                       |

* 宏
| C-x ( | start-kbd-macro     | 开始录制宏             |
| C-x ) | end-kbd-macro       | 结束宏录制             |
| C-x e | call-last-kbd-macro | 执行上一次绑定的宏命令 |
* vlf
** in vlf buffer:
| C-c C-v n   | vlf-next-batch            |
| C-c C-v p   | vlf-prev-batch            |
| C-c C-v spc | vlf-next-batch-from-point |
| C-c C-v +   | vlf-change-batch-size     |
| C-c C-v -   | vlf-change-batch-size     |
| C-c C-v s   | vlf-re-search-forward     |
| C-c C-v r   | vlf-re-search-backward    |
| C-c C-v %   | vlf-query-replace         |
| C-c C-v o   | vlf-occur                 |
| C-c C-v [   | vlf-beginning-of-file     |
| C-c C-v ]   | vlf-end-of-file           |
| C-c C-v j   | vlf-jump-to-chunk         |
| C-c C-v l   | vlf-goto-line             |
| C-c C-v e   | vlf-ediff-buffers         |
| C-c C-v f   | vlf-toggle-follow         |
| C-c C-v g   | vlf-revert                |
** in vlf occur buffer:
| RET       | vlf-occur-visit                              |   |
| o         | vlf-occur-show(cursor still in occur buffer) |   |
| SPC       | scroll-up-command                            |   |
| <         | beginning-of-buffer                          |   |
| >         | end-of-buffer                                |   |
| ?         | describe-mode                                |   |
| g         | revert-buffer                                |   |
| h         | describe-mode                                |   |
| n         | vlf-occur-next-match                         |   |
| p         | vlf-occur-prev-match                         |   |
| q         | quit-window                                  |   |
| DEL       | scroll-down-command                          |   |
| S-SPC     | scroll-down-command                          |   |
| <mouse-1> | vlf-occur-visit                              |   |
| M-RET     | vlf-occur-visit-new-buffer                   |   |
|           | vlf-occur-save                               |   |					
* 字体
| C-= | text-scale-increase |   |
| C-- | text-scale-decrease |   |
					
* 编码转换
|   | dos2unix                         | convert a buffer from dos ^M end of lines to unix end of lines |
|   | unix2dos                         |                                                                |
|   | revert-buffer-with-coding-system | revert buffer coding system.                                   |
					
* rectangle block矩形块操作
| C-x r k |   | cut                    |
| C-x r y |   | paste                  |
| C-x r o |   | insert rectangle block |
| C-x r c |   | clear                  |
| C-x r t |   | insert text            |
					
* 包管理
|   | package-refresh-contents RET |
|   | package-install RET xxx RET  |
|   | package-list-packages RET    |
					
* Mode
** C(C++)
| M-a     | backward-sentence      | 移动到语句开头                                                                 |
| M-e     | forward-sentence       | 移动到语句结尾                                                                 |
| C-M-a   | beginning-of-defun     | 移动到函数开头                                                                 |
| C-M-e   | end-of-defun           | 移动到函数结尾                                                                 |
| C-M-\   | indent-region          | 选中代码格式化                                                                 |
| M-q     | c-fill-paragraph       | 若光标在注释文本中间，则进行段落重排，保留缩进和前导字符                       |
| C-M-h   | c-mark-function        | 把光标放在当前函数开头，把文本块标记放在函数结尾，即把函数整个选作为一个文本块 |
| C-c C-q | c-indent-defun         | 对整个函数进行缩进                                                             |
| C-c C-u | c-up-conditional       | 移动到当前预处理条件的开始位置                                                 |
| C-c C-p | c-backward-conditional | 移动到上一个预处理条件                                                         |
| C-c C-n | c-forward-conditional  | 移动到下一个预处理条件                                                         |
| M-;     | comment-dwim           | 在当前行尾部添加注释                                                           |
| C-c C-c | comment-region         | 对一块代码进行注释；                                                           |
|         | uncomment-region       | 取消注释用命令                                                                 |
| C-c C-\ | c-backslash-region     | 将区域中的每一行结尾都加入一个??'\'字符                                        |
| C-c i   | helm-imenu             | list function                                                                  |
| C-c h i | helm-semantic-or-imenu | Helm interface to semantic/imenu                                               |
** org
*** 大纲
大纲模式可以隐藏缓冲区里的部分正文。Org 用绑定到 TAB 和 S-TAB 上的两个全命令来改变视图。

| TAB             | 子树循环：当加上一个前缀参数时（C-u TAB），在下面的状态中改变当前子树的视图 |
|                 | FOLDED->CHILDREN->SUBTREE                                                   |
|                 | 当加上shift键时会触发全局的视图循环。                                       |
| S-TAB和C-u TAB  | 全局循环：使整个缓冲区在下列状态中循环                                      |
|                 | OVERVIEW->CONTENTS->SHOWALL                                                 |
| C-u C-u C-u TAB | 显示全部，包括drawers。                                                     | 
  
**** 折叠大纲

| 快捷键 | 命令         | 说明                                                               |
|--------+--------------+--------------------------------------------------------------------|
| S-TAB  | org-shifttab | 循环切换整个文档的大纲状态（三种状态：折叠，打开下一级，打开全部） |
|--------+--------------+--------------------------------------------------------------------|
| TAB    | org-cycle    | 循环切换光标所在大纲的状态                                         |

**** 在大纲之间移动

| 快捷键    | 命令 | 说明                        |
|-----------+------+-----------------------------|
| C-c C-n/p |      | 下/上一标题                 |
|-----------+------+-----------------------------|
| C-c C-f/b |      | 下/上一标题（仅限同级标题） |
|-----------+------+-----------------------------|
| C-c C-u   |      | 跳到上一级标题              |
|-----------+------+-----------------------------|
| C-c C-j   |      | 切换到大纲浏览状态          |

**** 基于大纲的编辑

| 快捷键                | 命令 | 说明                                                       |
|-----------------------+------+------------------------------------------------------------|
| M-RET                 |      | 插入一个同级标题                                           |
| M-S-RET               |      | 插入一个同级TODO 标题                                      |
| M-LEFT/RIGHT          |      | 将当前标题升/降级                                          |
| M-S-LEFT/RIGHT        |      | 将子树升/降级                                              |
| M-S-UP/DOWN           |      | 将子树上/下移                                              |
| C-c *                 |      | 将本行设为标题/正文                                        |
| C-c C-w               |      | 将子树或区域移动到另一标题处（跨缓冲区）                   |
| C-x n s/w             |      | 只显示当前子树/返回                                        |
| C-c C-x b             |      | 在新缓冲区显示当前分支（类似C-x n s)                       |
| C-c /                 |      | 只列出包含搜索结果的大纲，并高亮，支持多种搜索方式         |
| C-c C-c               |      | 取消高亮                                                   |
|-----------------------+------+------------------------------------------------------------|
| TAB（新的空的条目中） |      | 	如果新的条目中还没有文字，TAB 会调整到合适的级别。 |

*** 文本列表
无序列表项以‘-’、‘+’或者‘*‘开头。
有序列表项以‘1.’、‘1)’或者开头。
描述列表用‘::’将项和描述分开。
同一列表中的项的第一行必须缩进相同程度。当下一行的缩进与列表项的的开头的符号或者数字相同或者更小时，这一项就结束了。
当所有的项都关上时，或者后面有两个空行时，列表就结束了。

当光标位于一项的第一行时（带有项标志符号的行），下面的命令将会作用于该项：

| TAB            | 折叠项                                                                                               |
| M-RET          | 在当前级别插入一个项，有前缀时是强制新建一个标题                                                     |
| M-S-RET        | 插入一个带有复先框的项（见 2.5 节［复先框］）                                                        |
| M-S-UP/DOWN    | 将当前项和它的子项向上/下移动（和相同的缩进的前/后一个项交换位置）。如果列表是有序的，数字会自动改变 |
| M-LEFT/M-RIGHT | 提升/降低项的缩进，不包含子项                                                                        |
| M-S-LEFT/RIGHT | 提升/降低项的缩进，包含子项                                                                          |
| C-c C-c        | 如果项中有复先框，就触发改变其状态。并且自动保持本项的符号与缩进在列表中的一致性                     |
| C-c -          | 循环改变将当前列表的项标志符号                                                                       |

*** 表格
任何以‘|’为首个非空字符的行都会被认为是表格的一部分。’|‘也是列分隔符。
当你在表格内部输入 TAB、RET 或者 C-c C-c 时表格都会自动调整。TAB 会进入下一个区域（RET 进入下一行）并且创建一个新的行。
当按 TAB、S-TAB 或者 RET 将光标移动到其他区域时，区域中会自动填充一些空格。
表格的缩进程度可以在第一行设定。以’|-’开头的一行会作为一个水平分隔行，当它下次调整排列时会将‘-’扩展至填充整行。

**** 创建和转换表格

| 快捷键   | 命令 | 说明             |
|----------+------+------------------|
| C-c 竖线 |      | 创建或转换成表格 |

**** 调整和区域移动  

| 快捷键  | 命令 | 说明                           |
|---------+------+--------------------------------|
| C-c C-c |      | 调整表格，不移动光标           |
| TAB     |      | 移动到下一区域，必要时新建一行 |
| S-TAB   |      | 移动到上一区域                 |
| RET     |      | 移动到下一行，必要时新建一行   |

**** 编辑行和列

| 快捷键         | 命令 | 说明                             |
|----------------+------+----------------------------------|
| M-LEFT/RIGHT   |      | 移动列                           |
| M-UP/DOWN      |      | 移动行                           |
| M-S-LEFT/RIGHT |      | 删除/插入列                      |
| M-S-UP/DOWN    |      | 删除/插入行                      |
| C-c -          |      | 添加水平分割线                   |
| C-c RET        |      | 添加水平分割线并跳到下一行       |
| C-c ^          |      | 根据当前列排序，可以选择排序方式 |

*** 待办事项
Org 模式并不用一个单独的文件来维持TODO列表。它是一些笔记的集合体，因为TODO列表是在你记录笔记的过程中逐渐形成的。
**** 使用TODO状态
当标题以 TODO 开关时它就成为了一个 TODO 项，下面是一些使用 TODO 项的常用命令：

| C-c C-t      | 	将当前项的状态在（unmarked）->TODO->DONE 之间循环切换，同样的切换也可以在时间轴（timeline） 和议程（ agenda） 的缓冲区（buffer）中用 t 键“远程”进行 |   |
| S-RIGHT/LEFT | 	选择下一个/上一个 TODO 状态，与上面的循环方式相同。                                                                                                   |   |
| C-c / t      | 	在稀疏树中显示 TODO 项。将 buffer 折叠，但是会显示 TODO 项和它们所在的层次的标题。                                                                    |   |
| C-c a t      | 	显示全局 TODO 列表。从所有的议程文件中收集 TODO 项到一个缓冲区中。详见 10.3.2 节。                                                                    |   |
| S-M-RET      | 	在当前项下插入一个新的 TODO 项。                                                                                                                      |   |
|              |                                                                                                                                                               |   |

*** 优先级
Org模式支持三个优先级别：’A‘、’B‘和’C‘。’A‘是最高级别，如不指定，’B‘是默认的。优先级只在议程中有用。

| C-c ,  | 设置当前标题的优先级。按^^^选择一个级别，或者SPC删除标记（cookie）。 |
| S-UP   |                                                                      |
| S-Down | 增加/减少当前标题的优先级。                                          | 
  
*** 任务细分
为了能对已经完成的任务有个大致的了解，你可以在标题的任何地方插入‘[/]’或者‘[%]’。
当每个子任务的状态变化时，或者当你在标记上按 C-c C-c时，这些标记状态也会随之更新。例如：

#+BEGIN_EXAMPLE
 * Organize Party [33%]
 ** TODO Call people [1/2]
 *** TODO Peter
 *** DONE Sarah
 ** TODO Buy food
 ** DONE Talk to neighbor
 #+END_EXAMPLE

*** 复选框
当纯文本中的项以‘[]’开头时，就会变成一个复选框。复选框不会包含在全局 TODO 列表中，
所以它们很适合地将一个任务划分成几个简单的步骤。下面是一个复选框的例子：

#+BEGIN_EXAMPLE
 * TODO Organize party [1/3]
  - [-] call people [1/2]
    - [ ] Peter
    - [X] Sarah
  - [X] order food
  - [ ] think about what music to play
#+END_EXAMPLE

复选框是分层工作的。所以如果一个复选框项目如果还有子复选框，触发子复选框将会使该复选框变化以反映出一个、多个还是没有子复选框被选中。

下面是处理复选框的命令：
| C-c C-c | 	触发复选框的状态或者（加上前缀）触发复选框的的存在状态。       |
| M-S-RET | 	增加一个带有复选框的项。这只在光标处于纯文本列表项中才起使用。 |

*** 标签
标签默认是粗体，并和标题具有相同的颜色。
**** 标签继承
标签具有大纲树的继承结构。如果一个标题具有某个标签，它的所有子标题也会继承这个标签。
**** 设置标签
在标题后可以很容易地输入标签。在冒号之后，M-TAB 可以补全标签。也有一些专门的命令用于输入标签：
| C-c C-q | 为当前标题输入标签。Org 模式既支持补全，也支持单键接口来设置标签，见下文。回车之后，标签会被插入，并放到第 org-tags-column 列。如果用前缀 C-u，会把当前缓冲区中的所有标签都对齐到那一列，这看起来很酷。 |
| C-c C-c | 当光标处于标题上时，这个命令同C-c C-q。                                                                                                                                                                 |
**** 标签查找
| C-c \   |                                                                                                                                 |
| C-c / m | 	用匹配标签搜索的所有标题构造一个稀疏树。带前缀参数C-u时，忽略所有还是TODO行的标题。                                     |
| C-c a m | 	用所有议程文件匹配的标签构造一个全局列表。见第 10.3.3 节。                                                              |
| C-c a M | 	用所有议程文件匹配的标签构造一个全局列表，但只搜索 TODO 项，并强制搜索所有子项（见变量 org-tags-match-listsublevels）。 |
这些命令都会提示输入字符串，字符串支持基本的逻辑去处。像“+boss+urgent-project1”，是搜索所有的包含标签“boss”和“urgent”但不含“project1”的项；
而 “Kathy|Sally”，搜索标签包含“Kathy”或者“Sally”和项。搜索字符串的语法很丰富，支持查找TODO关键字、条目级别和属性。
*** 属性
属性是一些与条目关联的键值对。它们位于一个名为 PROPERTIES 的特殊抽屉中。第一个属性都单独一行，键在前（被冒号包围），值在后：
通过设置属性 “:Xyz_ALL:” ，你可以为属性 “:Xyz:” 设置所有合法的值。这个特定的属性是有 继承性 的，
即，如果你是在第 1 级别设置的，那么会被应用于整个树。当合法的值设定之后，设置对应的属性就很容易了，并且不容易出现打字错误。
用CD唱片集为例，我们可以预定义发行商和盒中的光盘数目：
#+BEGIN_EXAMPLE
 * CD collection
  :PROPERTIES:
  :NDisks_ALL: 1 2 3 4
  :Publisher_ALL: "Deutsche Grammophon" Philips EMI
  :END:
#+END_EXAMPLE
| C-c C-x p | 	设置一个属性。会询问属性名和属性值。 |
| C-c C-c d | 	从当前项中删除一个属性。             |

*** 日期和时间
**** 创建时间戳
时间戳要有特定的格式，这样才能被Org模式识别。下面的命令可以用来正确地处理时间戳的格式。

| C-c .        | 	询问日期并输入正确的时间戳。当光标处理一个时间戳之上时，是修改这个时间戳，而不是插入一个新的。如果这个命令连用再次，就会插入一个时间段。加上前缀会附带当前时间。                                                   |
| C-c !        | 	功能同C-c .，但是插入的是一个未激活的时间戳。                                                                                                                                                                      |
| S-LEFT/RIGHT | 	将光标处理的时间戳改变一天。                                                                                                                                                                                       |
| S-UP/DOWN    | 	改变时间戳中光标下的项。光标可以处在年、月、日、时或者分之上。当时间戳包含一个时间段时，如 “15:30-16:30”，修改第一个时间，会自动同时修改第二个时间，以保持时间段长度不变。想修改时间段长度，可以修改第二个时间。 |
**** 截止期限和计划安排
***** 截止期限
|C-c C-d|在标题下面一行插入一个带有“DEADLINE”关键字的时间戳。|
***** 日程安排
| C-c C-s | 在标题下面插入一个带有“SCHEDULED”关键字的时间戳。 |
**** 记录工作时间
| C-c C-x C-i     | 开始当前条目的计时（clock-in）。这会插入一个 CLOCK 关键字和一个时间戳。加上 C-u 前缀，从当前已经计时的任务中选择任务。 |   |
| C-c C-x C-o     | 停止计时（clock-out）。这会在开始计时的地方插入另一个时间戳。它会直接计算使用时间并插入到时间段的后面如 “=> HH:MM”。 |   |
| C-c C-x C-e     | 为当前的计时任务更新进度。                                                                                             |   |
| C-c C-x C-x     | 取消当前的计时。当你误操作打开一个计时时，或者转而去做其他事情时，这个命令就很有用。                                   |   |
| C-c C-x C-j     | 跳转到包含当前正在运行的计时的任务条目。用 C-uf前缀从当前计时的任务中选择。                                            |   |
| C-c C-x C-r     | 在当前文件插入一个包含像 Org 表格一样的计时报告的动态块。当光标正处于一个存在的块上时，更新它。                        |   |
|                 | #+BEGIN: clocktable :maxlevel 2 :emphasize nil :scope file                                                             |   |
|                 | #+END: clocktable                                                                                                      |   |
|                 | 如何定制视图，见手册                                                                                                   |   |
| C-c C-c	 | 在一个已经存在的计时表格之上时，更新它。 更新动态块。光标需要置于动态块 #+BEGIN 这行。                                 |   |
	
** javascript
** css			

