# SHAutoUploadIPA
一个简单的上传ipa包到fir或者蒲公英平台的脚本，简单方便！
具体使用步骤:
+ 1 如果是上传fir平台，把isFir变量更改为fir；上传蒲公英平台则改成pyger
+ 2 desktop参数改成自己本地的路径（本来是想使用绝对路径的，但是后面会报错，新手一枚不知道怎么解决，所以。。），如 ="/Users/用户名"
+ 3 appFileFullPath 路径改成你自己项目build + b 之后 .app 文件的路径即可
+ 4 如果是蒲公英平台的话： 需要获取ukey和apikey两个参数 ，具体可以参照[蒲公英获取ukey和apikey页面](https://www.pgyer.com/doc/api#uploadApp)，updateDescription参数是本更新内容；如果是上传到fir平台，则需要apiToken参数，可以去fir平台自行获取，projectDir是此次更新内容
+ 5 注意一下，如果是是上传fir平台的话，首先要登陆一下 打开终端 输入fir login API Token （API Token 就是平台上获取的token）如果出现了success等字样说明登陆成功
，然后还需要安装fir-cli工具，也很简单 终端输入sudo gem install -n /usr/local/bin fir-cli --no-ri --no-rdoc 等待完成即可

遵从以上步骤之后，打开终端，输入 sh + 脚本文件路径 （可以直接把文件拖动到终端中即可）等待完成即可

