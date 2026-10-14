# 中山大学物理学院开题报告 LaTeX 模版

本模版按照所提供的《附件1：物理学院研究生学位论文开题报告模板.doc》制作。正文保留第一部分的七个一级标题及其二级标题，删除括号内的提示、文献数量与比例要求。附带封面、摘要，以及图、表、公式、款标题和项的例子。

## 使用

编辑 `main.tex` 中的封面信息与各节内容，编辑 `references.bib` 中的文献。编译引擎必须选择 **XeLaTeX**，文献后端使用 **BibTeX**。

```sh
latexmk -xelatex main.tex
```

不使用 latexmk 时：

```sh
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

主文档只依赖包内现成的 `figures/example-flow.pdf`，不需要 shell-escape 或额外绘图工具。修改流程图源文件后，在 `figures` 目录用 `xelatex example-flow.tex` 重新生成图片。


## Overleaf 使用

1. 在 Overleaf 首页选择 **New project → Upload project**，上传本项目 ZIP。
2. 将主文档设为 `main.tex`，编译器选择 **XeLaTeX**。
3. 严格复现 Word 字体时，在自己的工程里上传 `fonts/README.md` 列出的字体；公开 ZIP 不包含这些商业字体。
4. 点击 **Recompile**。Overleaf 自动处理 `.bib` 文献，无需手动运行 BibTeX。

ZIP 只包含源文件、示例图片、通用示例 PDF 与说明，不含个人填写的信息、编译缓存、备份或原 Word。`main.tex` 中的封面信息已全部恢复为占位文字。

[Overleaf 导入工程说明](https://docs.overleaf.com/managing-projects-and-files/uploading-a-project) · [自定义字体说明](https://www.overleaf.com/learn/latex/Questions/I_have_a_custom_font_I%27d_like_to_load_to_my_document._How_can_I_do_this%3F)

## VS Code 使用

使用 **File → Open Folder** 打开本项目文件夹，安装 LaTeX Workshop，并使用默认构建命令。包内 `.vscode/settings.json` 已设置 `latexmk -xelatex`，自动运行文献工具并把 PDF 输出到 `build/`。正向定位为 macOS 的 `⌘⌥J`，反向定位为 PDF 双击。另需安装 TeX Live/MacTeX 和所需字体。

## 格式与原 Word 对照

| 对象 | 本模版设置 |
|---|---|
| 纸张 | 原文件的 11906 × 16838 twips，即约 210.009 × 297.004 mm（A4） |
| 四边页边距 | 原文件的 1418 twips，即 70.9 磅，约 25.012 mm |
| 页眉、页脚 | 原文件未设置页眉及可见页码；本模版同样不显示 |
| 正文 | 小四号宋体，12 磅；固定 22 磅基线距离；段前后 0；首行两字 |
| 英文与数字 | Times New Roman；公式中的直立字母与数字也用 TNR，数学变量、希腊字母和符号用 Times 风格的 newtxmath |
| 章级无编号标题 | 小二号黑体，22 磅，加粗居中；段后 22 磅；用于摘要和可选目录 |
| 节 `1` | 小三号宋体，16 磅，加粗；段前后 11 磅；题序顶格 |
| 条 `1.1` | 四号宋体，14 磅，加粗；段前后 11 磅；题序顶格 |
| 款 `1.1.1` | 小四号宋体，12 磅，不加粗；段前后 0；题序顶格 |
| 项 `（1）` | 小四号宋体；题序前两字宽，标题与接排内容间两字宽；段前后 0 |
| 图、表、公式 | 按一级章节重新计数，如图3-1、表5-1、式(3-1) |
| 图名与表名 | 图下、表上，居中；原文件未另定字号，采用正文宋体小四 |
| 文献列表 | 宋体小四，固定 22 磅行距；`[1]` 数字标签；按首次引用顺序排列 |

Word 第四部分存在“所有标题黑体”与逐级“宋体”要求的冲突，第四、五部分还分别要求节标题左空两格与题序顶格。本模版采用第四部分逐级字体规定、第五部分顶格题序规定。 第一部分的一级标题在第五部分对应“节”，所以使用 `\section`，没有另增“第1章”一级编号。

原 Word 封面的版次是“二零二三版”；不因通知年份或编译日期自动更改。封面保留学校、报告名称、个人信息、制表单位与版次结构。封面以原 `.doc` 在本机 Microsoft Word 中原生导出的 PDF 为视觉依据，用 LaTeX 文字和矢量横线按实测位置排版；学校名称的字间距、报告名称的字间距、题目横线、五项信息栏和底部文字位置均已对照。题目高度保留原字号；仅略超出栏宽时水平压缩最多 5%，较长题目自动换行并增加下划线。封面不是图片，信息仍可在 `main.tex` 中编辑。

摘要按章级标题规则使用黑体小二；Word 中摘要标题的局部直设格式是宋体三号，本模版优先采用第四部分标题规范。原文件未单独规定公式数学字体、图表题字号、文献字号、正文引用是否上标或目录样式；这些补充设置已在上表明示。目录默认关闭；如需目录，取消 `main.tex` 对应两行注释即可。

## 字体要求

严格使用宋体 `SimSun`、黑体 `SimHei` 和 `Times New Roman`，不会默默替换成思源字体、Fandol 或 TeX Gyre。宋体/黑体的加粗采用伪粗体，因为常见原版字体没有独立粗体字形。

在当前 macOS 上自动读取 Microsoft Word 的 `DFonts` 字体文件。Windows 上可以直接读取已安装的字体。原 Word 的学校名称指定旧版 `楷体_GB2312`，底部指定 `隶书`；这两种字体在本机 Word 中缺失，Word 实际分别用 **微软雅黑粗体**和**微软雅黑**显示。现封面默认匹配这个实际显示效果，优先读取 Microsoft Word 自带的 `msyh.ttc` / `msyhbd.ttc`，仅影响封面这三行，正文仍为宋体、黑体和 Times New Roman。若想恢复原文指定的字体外观，可在加载样式后使用 `\renewcommand{\ProposalCoverSchoolFont}{\kaishu\bfseries}` 与 `\renewcommand{\ProposalCoverFooterFont}{\ProposalLiti}`；这会改变封面外观。

在其他机器或云端环境中，应安装相应字体，或把有使用许可的字体放入 `fonts/`，使用以下文件名：`Simsun.ttc`、`SimHei.ttf`、`Kaiti.ttf`、`STLITI.ttf`。Times New Roman 也需可被系统识别。字体不随压缩包分发。也可在加载本包之前定义自有字体文件夹路径（末尾加 `/`）：

```tex
\newcommand{\ProposalFontPath}{/path/to/fonts/}
\usepackage{sysu-proposal}
```

## 文献

使用专用 `sysu-proposal.bst`，并非直接套用 zip 中毕业论文的 GB/T 样式。Word 第六部分标题说“四种”，实际含期刊、图书、会议、学位论文、电子文献五类。本模版覆盖这些类型，含译著。

`references.bib` 中的七条示例直接取自原 Word，仅演示格式，未作外部书目核验，正式写作请替换。文献排序会随正文首次引用顺序变化，所以示例编号不固定等于原 Word 的编号。

- 中文期刊：`作者. 题名[J]. 期刊，年份，卷（期）：页码.` 没有卷号时直接输出期号，与 Word 示例相同。
- 英文期刊：依 Word 的物理学期刊示例，输出 `C. M. Author, …, and J. P. Author, Title. Journal volume, pages（year）`，不额外补 `[J]`。年份括号依第六部分总标点规则用中文全角；原英文示例里是半角括号。此处明确优先采用总标点规则。
- 图书、译著：`作者. 题名[M]. 译者，译. 地点：出版社，年份：页码.` 没有译者时省略译者部分。
- 会议：`作者. 题名[C]//论文集. 地点：出版社，年份：页码.`
- 学位论文：`作者. 题名[D]. 地点：学校及学位说明，年份：页码.` `school` 可写完整说明，也可把学位说明放在 `type` 字段。
- 电子文献：`作者. 题名. URL，年，月，日`，与原示例一致，不自动添加原文没有的 `[EB/OL]`。

`language={zh}` 表示中文，`language={en}` 表示英文；也支持 `langid={chinese}`。中文作者使用 `{姓名}` 保留完整姓名，作者之间用 `and` 分隔。超过三位作者时列前三位后加“等”或 `et al.`；可用 `and others`。西文作者默认转换为“名字首字母 + 姓”，机构或需要原样显示的署名使用双层花括号。普通文字在 `.bib` 中的 `&`、`%`、`_` 等字符须作 LaTeX 转义；`url` 字段直接填网址。页码建议使用单个连字符 `79-84`，与 Word 示例一致。

```tex
文献引用\cite{liang1997}；多篇引用\cite{tang1999,hosney1989}。
图\ref{fig:workflow}，表\ref{tab:schedule}，式\eqref{eq:oscillator}。
```

如需上标引用，可用 `\textsuperscript{\cite{key}}`；默认正文引用是方括号数字。只输出已引用文献；如需列出 `.bib` 全部条目，在参考文献命令前使用 `\nocite{*}`。

## 日后转换成 Word

可以将完成的报告转换为本 Word 模版格式。请一起提供 `.tex`、`.bib`、本样式文件、图片和任何 `\input` 文件；也可直接提供整个工程压缩包。

转换时会先解析结构与引用，再应用原 Word 的页面和段落格式，并逐页渲染检查。普通正文、标题、标准表格、文献与常规公式可转换成可编辑的 Word 对象。TikZ 图或复杂的自定义宏可能需要先展开或转成图片；复杂公式需单独核对。LaTeX 与 Word 的断行、分页引擎不同，不能承诺逐行逐页完全相同，但可以按照同一学院格式整理。

默认交付 `.docx`，兼容现代 Word；如果必须提交旧版 `.doc`，可另行导出并再检查。保留 `\section` / `\subsection`、标准 `equation` / `table` / `figure`、`\label` / `\ref` 和 `.bib` 引用最方便后续转换。
