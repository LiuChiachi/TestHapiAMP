## 底层API：

### 动：

```
cd dygraph
CUDA_VISIBLE_DEVICES=0 nohup python train.py --config ../configs/amp.yaml > api_amp.log &
CUDA_VISIBLE_DEVICES=1 nohup python train.py --config ../configs/base.yaml > api_base.log &
cd ..
```

### 静态图

```
cd static
CUDA_VISIBLE_DEVICES=2 nohup python train.py --config ../configs/amp.yaml > api_amp.log &
CUDA_VISIBLE_DEVICES=3 nohup python train.py --config ../configs/fp16.yaml > api_fp16.log &
CUDA_VISIBLE_DEVICES=4  nohup python train.py --config ../configs/base.yaml > api_base.log &
cd ..
```

## 高层API：
### 动：

```
cd dygraph
CUDA_VISIBLE_DEVICES=0 nohup python train_hapi.py --config ../configs/amp.yaml > hapi_amp.log &
CUDA_VISIBLE_DEVICES=1 nohup python train_hapi.py --config ../configs/base.yaml > hapi_base.log &
cd ..
```

### 静态图

```
cd static
CUDA_VISIBLE_DEVICES=1 nohup python train_hapi.py --config ../configs/amp.yaml > hapi_amp.log &
CUDA_VISIBLE_DEVICES=3 nohup python train_hapi.py --config ../configs/fp16.yaml > hapi_fp16.log &
CUDA_VISIBLE_DEVICES=4  nohup python train_hapi.py --config ../configs/base.yaml > hapi_base.log &
cd ..
```
