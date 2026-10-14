# SYSU templates

中山大学 LaTeX 模版项目。目前包含物理学院研究生学位论文开题报告模版。

- [开题报告源文件与使用说明](physics-proposal/)
- [下载完整工程 ZIP](downloads/sysu-physics-proposal.zip)
- [查看通用示例 PDF](physics-proposal/main.pdf)

源文件与示例 PDF 的封面信息全部为占位内容，适合下载后自行填写。附图、表、公式和 BibTeX 文献示例。

## Overleaf

下载 ZIP 后，在 Overleaf 选择 **New project → Upload project**，将主文档设为 `main.tex`，编译器选择 **XeLaTeX**。严格使用 Word 指定的商业字体时，需在自己的 Overleaf 工程中自行上传字体，详见 [字体说明](physics-proposal/fonts/README.md)。本仓库不分发商业字体。

## 本地使用

进入 `physics-proposal` 目录，执行 `latexmk -xelatex main.tex`。VS Code 用户可直接打开该目录，包内配置自动处理参考文献并将 PDF 输出到 `build/`。

这是基于学院提供的 Word 模版制作的非官方 LaTeX 实现。字体与层级规范存在冲突时采用的约定，以及封面实际显示的字体对应，均在项目说明中列出。
