<p align="center">
<img src="https://github.com/elecTRON-Fellowship/StayFit/blob/aayush_design/design/Logo%20-%20SF(1).png" alt="drawing"/>
</p>

## Inspiration💡
Since the beginning of 2020, we have all found ourselves inside our homes. The pandemic forced everyone in, and the world literally came to a standstill. All the offices, schools, colleges, etc. were closed due to the spread of COVID-19, and going out of the house was something that was just not possible. The pandemic affected people all across the globe in many ways, but the one thing that got affected the most was people's health because of reduced physical activities. Everyone was constantly working from home, children were attending classes from the comfort of their rooms and there was little to no physical activity to keep the people fit, which has led to a noticeable adverse effect on public health all across the globe. The current COVID-19 forecasts predict that the work-from-home culture is here to stay, at least for a few years.</br>
**This inspired us to come up with a product - _StayFit_, that would help people in the pandemic tackle their health issues and drive them towards a healthier lifestyle**, and we plan to accomplish that in the most rewarding way possible.

## What it does💾
StayFit is a Mobile application that helps you keep your health in check in the best way possible. Your **personal MLRun-powered Yoga Guru** that helps you build the habit of doing Yoga! With help of Machine learning models, the application is able to detect the user's yoga pose and once the user has completed their daily yoga routine, they are rewarded with our in-app tokens! The user can even use the app for meditating! Staying healthy and doing yoga has never been this rewarding before!

## How we built it💻
![image](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![image](https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=TensorFlow&logoColor=white)
![image](https://img.shields.io/badge/Keras-D00000?style=for-the-badge&logo=Keras&logoColor=white)
![image](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![image](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![image](https://img.shields.io/badge/firebase-ffca28?style=for-the-badge&logo=firebase&logoColor=black)
![image](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![image](https://img.shields.io/badge/Solidity-e6e6e6?style=for-the-badge&logo=solidity&logoColor=black)


We started off by building the design and prototype for the application. The complete prototyping was done on FIGMA and once we had done that we went on to build the image classification models. We used an open-source dataset from Kaggle for training our model, which can be found [here](https://www.kaggle.com/niharika41298/yoga-poses-dataset).</br> 
We started off by building our own custom architecture for the model but as we were building a mobile application, we had to go with an architecture that would be smaller in size, hence we chose MobileNet. We made use of TensorFlow and Keras to build our model and exported it in '.h5' format which was later converted to tflite version as we were using Flutter to create our application.</br>
Once the model was ready we used MLRun and Iguazio for serving the model. We built the complete application using Flutter with a Firebase backend. As part of the data collection pipeline for further training the model in the future, we are using Firebase file storage to store the positively classified images from the users. One thing to be noted here is that this data is collected anonymously and does not contain any metadata to associate it with the users.

## Challenges we ran into📕
The biggest challenge that we ran into was using MLRun in our workflow. Understanding how everything works took a good amount of time, but thanks to the Slack channel and Iguazio team, we were able to serve the model using MLRun and Nuclio. Another challenge that we ran into was storing all the images onto Firebase and then using the image url for inference on Iguazio. 

## Accomplishments that we're proud of🎖
Despite not having a lot of knowledge about Flutter we chose to go with it to build our application and we were able to build a fully functional application. It was our very first time working with MLRun but we understood the framework and implemented it as well.

## What we learned🎉
We got to learn about stuff related to MLOps, especially MLRun. We also got to use and test out Iguazio! Apart from this we also learned about the working of Firebase and how we could integrate it in our application for our use case. We also came across and learned about different architectures to try for our models before finalizing our current model.

## Project Gallery📷
You Can check out the Figma Designs [here](https://www.figma.com/file/tEuKn1FEbi1hwfDHoG0YxS/StayFit?node-id=0%3A1)
<p align="center">
<img src="https://github.com/elecTRON-Fellowship/StayFit/blob/aayush_design/design/1.png" alt="drawing"/>
</p>
<p align="center">
<img src="https://github.com/elecTRON-Fellowship/StayFit/blob/aayush_design/design/2.png" alt="drawing"/>
</p>

## What's next for StayFit🚀
A key feature of our application is the reward system and ERC20 crypto-tokens for which we need to make the tokens using Solidity (and Ethereum blockchain) and use web3dart to incorporate it in our app. The tokens are ready and we will be working on incorporating them into our application in v2 of StayFit.
