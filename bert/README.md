### 运行底层API实现的模型

####  动

```
CUDA_VISIBLE_DEVICES=4 nohup sh run_dygraph.sh > api_dygraph_o1.log &
```

#### 静

```
CUDA_VISIBLE_DEVICES=3 nohup sh run_static.sh > api_static_o1.log  &
```

### 运行高层API实现的模型

```
export TASK_NAME=SST-2
CUDA_VISIBLE_DEVICES="1" nohup python -u ./run_glue_hapi.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $TASK_NAME \
    --max_seq_length 128 \
    --batch_size 64   \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --logging_steps 10 \
    --save_steps 10 \
    --output_dir ./tmp/$TASK_NAME/ \
    --n_gpu 1 \
    --dynamic \
    --mode "O0" > hapi_dygraph_o0.log &
```

```
export TASK_NAME=SST-2    
CUDA_VISIBLE_DEVICES="0" nohup python -u ./run_glue_hapi.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $TASK_NAME \
    --max_seq_length 128 \
    --batch_size 64   \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --logging_steps 10 \
    --save_steps 10 \
    --output_dir ./tmp/$TASK_NAME/ \
    --n_gpu 1 \
    --dynamic \
    --mode "O1" > hapi_dygraph_o1.log &
```
 
```
CUDA_VISIBLE_DEVICES="4" nohup python -u ./run_glue_hapi.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $TASK_NAME \
    --max_seq_length 128 \
    --batch_size 64   \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --logging_steps 10 \
    --output_dir ./tmp/$TASK_NAME/ \
    --save_steps 10 \
    --n_gpu 1 \
    --mode "O0" > hapi_static_o0.log &
``` 

```
export TASK_NAME=SST-2
CUDA_VISIBLE_DEVICES="2" nohup python -u ./run_glue_hapi.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $TASK_NAME \
    --max_seq_length 128 \
    --batch_size 64   \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --output_dir ./tmp/$TASK_NAME/ \
    --logging_steps 10 \
    --save_steps 10 \
    --n_gpu 1 \
    --mode "O1" > hapi_static_o1.log &
``` 

```
export TASK_NAME=SST-2
CUDA_VISIBLE_DEVICES="0" nohup python -u ./run_glue_hapi.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $TASK_NAME \
    --max_seq_length 128 \
    --batch_size 64   \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --output_dir ./tmp/$TASK_NAME/ \
    --logging_steps 10 \
    --save_steps 10 \
    --n_gpu 1 \
    --mode "O2" > hapi_static_o2.log &
```



export TASK_NAME=SST-2
CUDA_VISIBLE_DEVICES="2" python -u ./run_glue_hapi.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $TASK_NAME \
    --max_seq_length 128 \
    --batch_size 64   \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --output_dir ./tmp/$TASK_NAME/ \
    --logging_steps 10 \
    --save_steps 10 \
    --n_gpu 1 \
    --mode "O2"

