# 自行提供的字体

此目录不分发商业字体。严格复现模版时，可将自己有权使用的字体上传至私人 Overleaf 工程中，保持以下文件名和大小写：

| 文件 | 用途 |
|---|---|
| `Simsun.ttc` | 正文宋体 |
| `SimHei.ttf` | 黑体 |
| `Kaiti.ttf` | 楷体备用字体族 |
| `STLITI.ttf` | 华文隶书备用字体族 |
| `times.ttf` | Times New Roman 常规 |
| `timesbd.ttf` | Times New Roman 粗体 |
| `timesi.ttf` | Times New Roman 斜体 |
| `timesbi.ttf` | Times New Roman 粗斜体 |
| `msyh.ttc` | 封面底部微软雅黑 |
| `msyhbd.ttc` | 封面学校名称微软雅黑粗体 |

前八个文件用于完整编译；最后两个用于与本机 Word 实际封面显示一致。缺少最后两个时，封面学校名称和底部会使用楷体及华文隶书备用字体，因此外观有差别。

主样式会自动识别这里的 `Simsun.ttc`、`times.ttf` 和 `msyh.ttc`。Microsoft Word for macOS 的对应文件通常位于其应用包的 `Contents/Resources/DFonts/` 目录。将宋体文件名改为 `Simsun.ttc`，保持本表命名即可。

字体文件已经加入 `.gitignore`，请勿在公共仓库中提交自己没有分发权的字体文件。
