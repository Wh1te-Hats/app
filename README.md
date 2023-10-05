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

The Career Recommendation Model utilizes job listings data to recommend suitable careers based on specified skills. It analyzes job data, processes skills, and employs a Decision Tree Classifier for skill-based career predictions. When a match is identified, the model provides a career recommendation. Additionally, it employs cosine similarity to identify up to three other careers with similar skill requirements, offering a total of four recommendations <br>
<br>
### UI screenshots of Mobile App 📸

<p align="center">	
<table align="center">


  <tr>
	  <td align="center"><b>Welcome Screen</b></td>
	  <td align="center"><b>Home Screen</b></td>
	  <td align="center"><b>Aptitude Tests</b></td>

  <tr>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/8cb2557c-4e43-4e60-a4dc-0246492a44ed" width=270 height=590></td>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/f75e5739-a4a3-4e30-b1c0-7f738479143d" width=270 height=590></td>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/aa96ca49-846e-43f6-a304-e6b026481a6b" width=270 height=590></td>
  </tr>
		
  <tr>
	  <td align="center"><b>Colleges</b></td>
	  <td align="center"><b>Analytics</b></td>
	  <td align="center"><b>Jobs</b></td>
  </tr>
  
	
  <tr>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/bd259fc8-04b1-4419-b34d-e9b12f627ebf" width=270 height=590></td>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/fd846ef2-7a26-4ef4-a5e7-c05a60df9707" width=270 height=590></td>
    <td><img src="https://github.com/Wh1te-Hats/app/assets/101006060/8f45838d-eb2b-42e3-ab4b-44711c5f8183" width=270 height=590></td>
  </tr>	
		
 </table>	
</p>


### Buisness Potential 	:chart_with_upwards_trend:	
---
Monetization Channels:
 - Dedicated Aptitude Tests: In the existing market, paid specialized
tests account for 15% of total revenue, Pragati can charge users
for dedicated aptitude tests.
 - In-Depth Analytics: Premium analytics services have consistently contributed to 20% of revenue for leading platforms in the current market, Pragati can offer personalized insights on strengths, weaknesses, and career prospects.
   
Partnerships:
 - Collaborations: Collaborating with educational providers has led
to a 25% revenue boost for established platforms in the current
market.
 - Service Recommendations: In the existing market, referral
programs have contributed to 15% of total revenue for
education-focused platforms.
