# CameraCalibration
Script for calibrate a camera.  
The code return:  
1. *calibrated camera matrix K*  
2. *vector containing the radial and tangential distortion coefficents*

**For _OCTAVE_ version**  
In the code is used the ***Octave Symbolic Package***. 
For install the symbolic package run in octave command line  
*pkg install -forge symbolic*  
  
The symbolic package require:  
* python
* sympy (≥ 1.2)  
* mpmath (≥ 1.0)


## RUN:
For running the code, putting in the same folder of the script the files that contains:  
* Initial guess for camera parameters
* Grid points
* Image points and transformations world in camera frame
