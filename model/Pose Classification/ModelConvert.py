import tensorflow as tf
from tensorflow import keras

tf_lite_model = 'YogaPose_MobileNet.tflite'
model = keras.models.load_model('/YogaNet_Model_3_MobileNet.h5')
tf_lite_converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = tf_lite_converter.convert()
tflite_modelname = tf_lite_model
open(tflite_modelname,"wb").write(tflite_model)