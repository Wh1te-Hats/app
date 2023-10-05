# Pragati 

This project guides every child at secondary level to make career choices and provides AI based counselling accessible along with aptitude tests and detailed career paths.

Pragati transforms the student career exploration process, offering tailored guidance by assessing their unique skills and interests. Dynamic aptitude testing measures proficiency and provides future career prospect visualizations, exam and course advice.

### Video :movie_camera:
---
<a href="https://www.youtube.com/watch?v=Qj7DdwmhMtw">
    <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/101006060/272869819-7832426a-007b-4e60-ab15-e439c23e53dc.png" alt="Pragati" width="400" height="500">
</a>


### Why Pragati ?? :point_down:
---
Pragati transforms the student career exploration process, offering tailored guidance by assessing their unique skills and interests. Dynamic aptitude testing measures proficiency and provides future career prospect visualizations, exam and course advice.

### Purpose behind Pragati :iphone:
---
- To empower students in their career planning by providing valuable insights and guidance.
- To offer personalized career recommendations based on individual skills and interests.
- To help students assess their aptitude and evaluate proficiency, aiding students in understanding their strengths and weaknesses.
- To provide statistical visualizations of future career prospects in various fields, helping students to choose their ideal path


### Use Cases :writing_hand:
---
 - Career Assessment
 - Aptitude Testing
 - Personalized Recommendations
 - Higher Education Guidance
 - Customization
 - Progress Tracking


### Show Stoppers :clapper:
---
 - Dynamic and customizable aptitude testing
 - Skill based career recommendation
 - Analytics of Aptitude Test Result.
 - Visual data for better decision making
 - 24*7 ChatBot
   

### The System Design - Workflow 🖊
---
![System_design_Pragati](https://github.com/Wh1te-Hats/app/assets/101006060/09c5cd29-0f4d-442a-bb47-b88ebb71705f)



### Approach Details 📝
---
Pragati offers customized questions based on user requests. For topics under high demand, it retrieves questions from a preexisting pool in Redis, ensuring that users receive reliable and frequently asked questions. For less popular topics, it uses a Large Language Model (LLM) to generate fresh questions, tailored to the
user's request. This approach ensures users always receive relevant questions for their tests or study needs.

The Career Recommendation Model utilizes job listings data to recommend suitable careers based on specified skills. It analyzes job data, processes skills, and employs a Decision Tree Classifier for skill-based career predictions. When a match is identified, the model provides a career recommendation. Additionally, it employs cosine similarity to identify up to three other careers with similar skill requirements, offering a total of four recommendations

### UI screenshots of Mobile App 📸

<p align="center">	
<table align="center">


  <tr>
	  <td align="center"><b>Welcome Screen</b></td>
	  <td align="center"><b>Home Screen</b></td>
	  <td align="center"><b>Aptitude Tests</b></td>

  <tr>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/8cb2557c-4e43-4e60-a4dc-0246492a44ed" width=270 height=590></td>
    <td><img src="https://github.com/NakamotoSans/Screens/blob/main/IMG_20210725_145106.jpg" width=270 height=590></td>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/aa96ca49-846e-43f6-a304-e6b026481a6b" width=270 height=590></td>
  </tr>
		
  <tr>
	  <td align="center"><b>Add Driver Details</b></td>
	  <td align="center"><b>Link Wallet</b></td>
	  <td align="center"><b>Searching Phase</b></td>
  </tr>
  
	
  <tr>
    <td><img src="https://github.com/NakamotoSans/Screens/blob/main/Screenshot_2021-07-25-15-06-28-217_com.sans.nakamoto.jpg" width=270 height=590></td>
    <td><img src="https://github.com/NakamotoSans/Screens/blob/main/IMG_20210725_150003.jpg" width=270 height=590></td>
    <td><img src="https://github.com/NakamotoSans/Screens/blob/main/IMG_20210725_150640.jpg" width=270 height=590></td>
  </tr>	
		
  <tr>
	  <td align="center"><b>Select Pickup and Drop Locations</b></td>
	  <td align="center"><b>Active Ride Requests</b></td>
	  <td align="center"><b>Ride Confirmed</b></td>
  </tr>
  <tr>
    <td><img src="https://github.com/NakamotoSans/Screens/blob/main/IMG_20210725_151310.jpg" width=270 height=590></td>	
    <td><img src="https://github.com/NakamotoSans/Screens/blob/main/Screenshot_2021-07-25-15-06-57-049_com.sans.nakamoto.jpg" width=270 height=590></td>
    <td><img src="https://github.com/NakamotoSans/Screens/blob/main/IMG_20210725_150832.jpg" width=270 height=590></td>
    
  </tr>	
 </table>	
</p>


### Prerequisites
---
- Nodejs v9.10 or above
- Truffle v4.1.8 (core: 4.1.8) (http://truffleframework.com/docs/getting_started/installation)
- Solidity v0.8.0
- Metamask (https://metamask.io) /Ganache Wallet

### Deployment Steps:
---

#### Smart contracts

Steps to Execute Solidity Smart Contract using Remix IDE

Remix IDE is generally used to compile and run Solidity smart contracts. Below are the steps for the compilation, execution, and debugging of the smart contract. 
 

Step 1: First clone our GitHub project from here. Open Remix IDE on any of your browsers, Choose solidity as the environment.
```
git clone https://github.com/NakamotoSans/Contracts
cd Contracts
```
Step 2:Import the contracts from your local system. Click the Compile button under the Compiler window to compile the contract.
Step 3: To execute the code, click on the Deploy button under the Deploy and Run Transactions window.
Step 4: After deploying the code click on the method calls under the drop-down of deployed contracts to run the program, and for output, check to click on the drop-down on the console.
Step 5: For debugging click on the Debug button corresponding to the method call in the console. Here you can check each function call and variable assignment.

#### Mobile Application

Step 1: Make sure you have the development environment is setup for [React-Native](https://reactnative.dev/docs/environment-setup).
Step 2: Clone our Application GitHub repo
```
git clone https://github.com/NakamotoSans/Application
cd Application
```
Step 3: Install all the dependencies
```
yarn install //recommended
```
or
```
npm install
```
Step 4: Start the Metro

```
npx react-native start
```

Step 5: Run the Application
```
npx react-native run-android
```
