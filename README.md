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


## Run:
For running the code, putting in the same folder of the script the files that contains:  
* Initial guess for camera parameters (*camera_param_initial_guess.dat*)
* Grid points (*camera_param_initial_guess.dat*)
* Image points and transformations world in camera frame (*image-%d.dat*)

:triangular_flag_on_post: The folder ***Octave_Script_NOsym*** include the same code without the calculation of the symbolic jacobian, so is not required the Symbolic Package for Octave
