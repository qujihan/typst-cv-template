# 快速上手

```shell
# 将此项目作为git子模块添加
git submodule add https://github.com/qujihan/typst-cv-template.git typst-cv-template
git submodule update --init --recursive

# 实时预览
python typst-cv-template/op.py w

# 编译
python typst-cv-template/op.py c

# 格式化typst代码
python typst-cv-template/op.py f
```