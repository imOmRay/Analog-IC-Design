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

