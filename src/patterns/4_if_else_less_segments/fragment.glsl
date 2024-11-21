precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {



  float strength = mod(vUv.x * 10.0, 1.0);

  // we just want to modify example from previous lesson
  // since because of the if else we end up having 20
  // segments in total
  // we want just 10 segments, so we multiply with 5.0 instead of 10.0 
  strength = mod(vUv.x * 5.0, 1.0);
  // --------------------------------------

  

  if(strength < 0.5) {
    strength = 0.0;
  }else{
    strength = 1.0;
  }

  gl_FragColor = vec4(vec3(strength), 1.0);

  

}