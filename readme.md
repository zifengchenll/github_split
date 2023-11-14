### 工具目的：

解决GitHub仓库平台不能支持100M以上文件问题（超过100M文件只能使用LFS存储，但是费用非常高，土豪可以考虑），在上传前使用本脚本，可以将无限大的文件进行上传，可以达到GitHub仓库最大值100G！

如果你足够聪明，再改造一下，可以将GitHub仓库做成一个免费的云盘，TODO



### 实现思路：

在上传大文件之前：运行自动分包脚本，会自动检测超过100M以上的文件，并进行文件分割

在下载仓库了之后：运行自动组包脚本，会自动检测需要组包的文件，进行自动组包，进行文件还原



### 使用方法：

```
.
├── build
│   ├── bl602_harmonyos_docker
│   ├── hi3861_harmonyos_docker
│   ├── middleware_ci_docker
│   └── middleware_docker
├── docker_env
│   ├── docker_env.sh
│   └── Readme.md
├── docker_install
│   ├── Readme.md
│   └── ubuntu_docker_install.sh
├── github_split
│   ├── merge_file.sh
│   ├── split_file.sh
│   ├── split_log_md5.txt
│   └── split_log.txt
└── Readme.md
```

```
上传前：
$ cd ./github_split/ && ./split_file.sh
```

```
下载后：
$ cd ./github_split/ && ./merge_file.sh
```

