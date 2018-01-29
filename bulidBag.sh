#!/bin/sh

#  bulidBag.sh
#  SHRxSwfitLearing
#
#  Created by SHyH5 on 2018/1/27.
#  Copyright © 2018年 SHyH5. All rights reserved.


# ************************ 相关参数配置（蒲公英和fir 二选一） **************************

# 设置是使用fir上传(改成fir)还是蒲公英上传pgyer(改成pgyer) --
isFir="fir"
# 换算成自己主文件路径 --（使用绝对路径报错，不知道为何）--
desktop="/Users/SHyH5"
# .app 文件的路径
appFileFullPath="$desktop/Library/Developer/Xcode/DerivedData/Crabs_star-ecmbwynyqwascabsqciprgvdohnj/Build/Products/Debug-iphoneos/Crabs_star.app"
#appFileFullPath="$desktop/Library/Developer/Xcode/DerivedData/FirTextExmple-aqjhktrtgzvszeevtcsdjrypkvfs/Build/Products/Debug-iphoneos/FirTextExmple.app"

# 蒲公英的参数： 自行填写自己账号对应的key值  上传文档地址：https://www.pgyer.com/doc/api#uploadApp
uKey="4cd7a6d5fe0fe56b0256bb3114e880a2"
apiKey="3178c9431a6eb6b0dda9cea0f6b25ba5"
# 蒲公英需要填写的版本描述
updateDescription="这是一个测试路径的版本"

# 上传到fir时，运行脚本之前要先登录一下：fir login API Token。 出现成功字段即可
# fir的参数:
#apiToken="62284d44d88e34c013e481184b409fb8"
apiToken="4995a8a6c0ae1b57fba71c2c50126e57"
#
projectDir="这是一个上传测试fir的脚本描述"
# **************************************************

programBag="$desktop/Desktop/ProgramBag"
payloadPath="$desktop/Desktop/Payload"
#计时
SECONDS=0

uploadMethod() {
if [ $isFir == "fir" ]; then
#  或者上传IPA到fir上面 -- 明天写 --
echo "正在上传到fir.im...."
fir publish "$programBag/Payload.ipa" -T "$apiToken" -c ${projectDir}
echo "\n🎉🎉打包上传更新成功！"
#输出总用时
echo "===总计用时为: ${SECONDS}s==="
rm -rf ${programBag}
else

echo "正在上传到蒲公英...."
#  上传IPA到蒲公英  file=@$programBag/Payload.ipa
curl -F "file=@$programBag/Payload.ipa" \
-F "uKey=$uKey" \
-F "_api_key=$apiKey" \
-F "updateDescription=$updateDescription" \
https://www.pgyer.com/apiv1/app/upload

if [ $? -eq 0 ]
then
echo "\n🎉🎉上传蒲公英成功"
echo "===总计用时为: ${SECONDS}s==="
rm -rf ${programBag}
else
echo "上传蒲公英失败"
fi
fi
}

mkdir -p ${payloadPath}
cp -r ${appFileFullPath} ${payloadPath}
mkdir -p ${programBag}
cp -r ${payloadPath} ${programBag} && rm -rf ${payloadPath}
cd ${programBag}
zip -q -r ./Payload.zip ./* && rm -rf Payload
if [ $? -eq 0 ]
then
mv Payload.zip Payload.ipa
echo "压缩成功"
uploadMethod
else
echo "压缩失败"
fi









