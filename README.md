# rime-wubi

[RIME](https://rime.im/download/)／中州韵输入法引擎，是一个跨平台的输入法算法框架。
基于这一框架，Rime 开发者与其他开源社区的参与者在 Windows、macOS、Linux、Android 等平台上创造了不同的输入法前端实现。

#### 配置说明：
> 将文件拷贝至用户目录，然后重新部署即可。

```
Mac OSX: 鼠鬚管 (Squirrel) 配置目录：~/Library/Rime/
Linux: 中州韻 (ibus-rime) 配置目录：~/.config/ibus/rime/
Windows: 小狼毫 (Weasel) 配置目录：%APPDATA%\Rime
```

Rime 的配置文件不同平台的放置在不同的目录， 在配置目录中，主要使用 yaml 进行配置。 目录中自有的配置文件不建议直接修改，因为可能会被自动复写。 用户配置一般以原始配置文件名增加 .custom 二级后缀的方式， 例如：Mac OSX 下的原始配置 squirrel.yaml，对应的用户配置就是 squirrel.custom.yaml 文件。

修改 .custom 配置后，『重新部署』Rime 输入法会将用户的配置增加或更新到 对应的原始配置中。

#### 更多：
> [配置指南](https://github.com/rime/home/wiki/CustomizationGuide)
