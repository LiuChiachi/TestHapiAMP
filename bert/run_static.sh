export TASK_NAME=SST-2

python -u ./run_glue_static.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name $TASK_NAME \
    --max_seq_length 128 \
    --batch_size 64   \
    --learning_rate 2e-5 \
    --num_train_epochs 3 \
    --logging_steps 300 \
    --save_steps 500 \
    --output_dir ./tmp/$TASK_NAME/  \
    --use_amp True \
    --use_pure_fp16 True \
