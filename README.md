# Analog-IC-Design
Analog IC Design Internship Report Name: Om Dibyajyoti Ray SIC: 23BEEJ16 Branch: Electrical & Electronics Engineering Duration: June 2nd, 2025 – June 20th, 2025 Mentor: Dr. Saroj Rout

🛠️ Software Used Xschem Ngspice Siliwiz Git & GitHub

📑 Table of Contents USB Microphone System Analysis High-Pass Filter Circuit Siliwiz Simulation Current Mirror FET Characterization NFET Characterization

1.USB Microphone System Analysis This section explains the analog front-end of a U
<img width="1280" height="666" alt="17541334996366662409608514710219" src="https://github.com/user-attachments/assets/f6defd05-3786-4b0e-a1df-9a71332aa963" />

🔧 System Overview MEMS Microphone (SPH8878LR5H-1): Captures sound and outputs an analog voltage signal Op-Amp (OPA344): Amplifies & filters ADC + USB Output: Digitizes and sends to PC 🎧 This design enables real-time USB-MIDI output via analog signal conditioning.

🎛️ Thevenin Equivalent Model of the Microphone To understand the microphone as a signal source, it can be modeled with its Thevenin equivalent:

This model helps in:


Analyzing signal strength and loading Impedance matching for the amplifier input Ensuring minimal signal loss at the interface
<img width="1423" height="788" alt="17541336503743020520961760886418" src="https://github.com/user-attachments/assets/a72b88df-f62b-4068-aae1-750dc20fcc94" />

📈 Output Response of the Microphone Circuit The simulation below shows the voltage output (vout) across the load, after signal amplification and filtering.

Mic Output Plot

<img width="1415" height="708" alt="17541338007582985230850898395336" src="https://github.com/user-attachments/assets/24703462-a5e4-4f9f-8efc-16250bca0669" />

🧪 This waveform helps verify if the designed circuit properly amplifies the mic signal within expected voltage ranges.
📈 Frequency Response The frequency response reveals the bandwidth and filtering effects of the analog stage. Mic Frequency Response
<img width="1600" height="659" alt="17541339363112573970792081371457" src="https://github.com/user-attachments/assets/c5d319c7-6edd-465c-88c7-4355d2beccd4" />

🔁 Simulink Output The Simulink simulation confirms system-level behavior and time-domain signal dynamics.


<img width="488" height="347" alt="17541339768447874726652061198943" src="https://github.com/user-attachments/assets/d2421dc4-24e7-44fa-b802-2458a7e777de" />
Op-Amp Modeling as a Single Pole System To better analyze the frequency response of the analog front-end, the operational amplifier is modeled using a single-pole transfer function. This provides insight into the bandwidth limitations and phase behavior of the amplifier.

<img width="1606" height="780" alt="17541340267653163556912031508042" src="https://github.com/user-attachments/assets/01fd4937-5cbb-405a-9183-ccf9b9b50266" />
Simulink Output The Simulink simulation confirms system-level behavior and time-domain signal dynamics
<img width="493" height="350" alt="17541340820537888488141046283879" src="https://github.com/user-attachments/assets/a6849eb5-548c-4635-a612-c4ffaebdc3b3" />

4.Current Mirror The circuit is used to copy the flow of current in one active device and controlling the flow of current in another device by maintaining the output current stable instead of loading

<img width="931" height="394" alt="17541341302786444765067748737231" src="https://github.com/user-attachments/assets/4b1750d3-c9d0-4710-8fba-8b3c5bf478eb" />
high-Pass Filter Circuit This section explains the working and transfer function of a high-pass filter using an op-amp.

