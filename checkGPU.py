import tensorflow as tf

def check_gpu():
    numOfGPU = len(tf.config.list_physical_devices('GPU'))
    print(numOfGPU)

if __name__ == "__main__":
    check_gpu()