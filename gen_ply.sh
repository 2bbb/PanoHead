#!/usr/bin/env bash

models=("easy-khair-180-gpc0.8-trans10-025000.pkl")
# models=("ablation-trigridD-1-025000.pkl")

in="models"
out="pti_out"

NUM_STEPS=300
NUM_STEPS_PTI=300

for model in ${models[@]}

do
    for i in 0
    do 
        # perform the pti and save w
        python projector_withseg.py --shapes=True --num-steps=${NUM_STEPS} --num-steps-pti=${NUM_STEPS_PTI} --outdir=${out} --target_img=dataset/testdata_img --network ${in}/${model} --idx ${i}
    done
done
