# A-MATLAB-Powered-SMART-FITNESS-TRACKER

An end-to-end, sensor-driven fitness tracking and activity classification system built entirely in MATLAB.

👥 Team Details

Team Name: AlgoRhythms

Team Members:

Samiran Jana

Rajdeep Ray

Soumyadeep Datta

Susmit Thakur

📌 Developed as part of a Hackathon project

📌 Problem Statement

Modern lifestyles are increasingly sedentary, leading to rising health risks. While fitness trackers exist, they often suffer from:

High cost and dependency on proprietary ecosystems

Inaccurate activity classification

Limited accessibility for students and everyday users

There is a clear need for an affordable, accurate, and data-driven fitness tracking solution that can work using commonly available smartphone sensors.

💡 Our Solution

We built a Smart Fitness Tracker using MATLAB that:

Detects and classifies human activities (walking, running, stairs, sitting)

Accurately computes steps, distance, stair flights, duration, and calories

Uses accelerometer, GPS, and altitude data — no wearable device required

Provides rich visualizations and interpretable insights

This project demonstrates how signal processing + intelligent rules can replicate core features of commercial fitness trackers.

⚙️ How the Tracker Works :

1️⃣ Data Capture

Smartphone sensor data (.mat files)

Accelerometer (X, Y, Z)

GPS (latitude, longitude, speed)

Altitude data

2️⃣ Signal Processing

Acceleration from all axes is converted into a single magnitude signal

Noise is reduced using smoothing techniques

Data patterns (vibrations) are extracted for activity recognition

3️⃣ Step Detection (Peak & Prominence Method)

Each footstep produces a characteristic peak in acceleration

Peak height identifies steps

Peak prominence distinguishes real steps from noise

This approach makes step counting robust and activity-aware

Final Live Script

4️⃣ Activity Classification (Activity Fingerprinting)

Each activity has a unique fingerprint based on:

Average acceleration magnitude (intensity)

Standard deviation (shakiness)

Using these two features, the system classifies:

Walking

Running

Stair climbing

Sitting / stabilized states

This makes the model data-driven yet interpretable, without heavy ML overhead.

5️⃣ Distance Calculation (Haversine Formula)

Simple distance formulas fail due to Earth’s curvature

We use the Haversine formula to calculate real-world distance accurately

Distance is computed by summing small GPS path segments

Final Live Script

6️⃣ Stair Climb Detection

Based on altitude gain

One flight counted per 3 meters (10 feet) of sustained elevation

Smart logic ignores small hills and sensor noise

7️⃣ Calorie Estimation (MET-Based)

Calories are estimated using:

Detected activity type

Workout duration

User body weight

Standard MET (Metabolic Equivalent of Task) values

This is a scientifically accepted approach for calorie estimation.

📊 Features & Highlights

✔ Smart peak-based step counter ✔ Accurate distance tracking using GPS + Haversine ✔ Altitude-based stair detection ✔ MET-based calorie estimation ✔ Rule-based activity classifier ✔ Speed-based route heat maps ✔ Step visualization graphs ✔ Activity fingerprint clustering plots

📈 Visual Outputs

The system generates:

Acceleration vs sample plots with detected steps

Speed-colored route heat maps

Activity fingerprint scatter plots

Workout summaries (steps, distance, calories, duration)

All visuals are generated dynamically in MATLAB

Final Live Script



🧠 Why This Project Is Unique

🚫 No black-box ML — fully explainable logic

📱 Works with smartphone sensors only

💰 Affordable alternative to wearables

📊 Strong focus on signal analysis & visualization

🔧 Modular, extensible MATLAB architecture

🚀 Future Scope

🔁 Transition to full Machine Learning models using larger datasets

🖥️ Complete MATLAB App Designer GUI

⏱️ Real-time sensor data streaming

📱 Deployment as a standalone fitness app

🤝 Integration with health platforms and APIs

🏁 Conclusion

This project proves that accurate fitness tracking can be achieved using intelligent signal processing and rule-based analytics — without expensive hardware.

Our vision is to democratize health tracking by making it accessible, accurate, and scalable for everyone.

“Let’s make fitness accessible, accurate, and inspiring.”


📌 Explore more here:

 🔗 GitHub (code + README): https://github.com/rajdeep-5370/A-MATLAB-Powered-SMART-FITNESS-TRACKER

>> For the explanation PDF, working presentation & Full Explanative Video or collected Readings ,Do check out:

https://drive.google.com/file/d/1cr_yMG2lnV_XMxPWapA_Nn-c_dg86_rm/view?usp=sharing


#Hackathon #MATLAB #SignalProcessing #FitnessTech #AIProjects #StudentDevelopers #Engineering #AlgoRhythms
