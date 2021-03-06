# TestHapiAMP

本repo中的代码支持在非hapi实现的模型、hapi实现的模型下，分别运行动态图O0，O1，静态图O0，O1，O2，测试HAPI封装AMP逻辑后，是否与底层API AMP效果一致（精度、运行时间）

非hapi实现的模型：
Transformer、bert的静态图代码参考的是 https://github.com/PaddlePaddle/PaddleNLP/tree/develop/benchmark 实现

bert动态图参考了 https://github.com/PaddlePaddle/PaddleNLP/blob/develop/examples/language_model/bert/run_glue.py

并在模型中补充了用visualdl画图的逻辑。

为了对比，也增加了Hapi实现(hapi可同时支持动静态图），用高层API的paddle.callbacks.VisualDL画图

运行两个目录中的README给的命令，并对配置参数进行修改，可以进行测试

**NOTE**
bert、transformer需要把shuffle、dropout都关掉
静态图和动态图的bert 实现有差异，不能做到分类层的初始化参数一样，所以需要把paddlenlp中的from_pretrain函数中的state_dict中设置classifier.weight和classifer.bias以固定参数。
为了防止bert 在静态图pure fp16训练出nan，可以把BertModelForSequenceClassification中的self.bert加入fp16_guard范围内。
