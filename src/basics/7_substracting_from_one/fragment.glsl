precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {


  // substracting from 1.0 will create an inversion in this case
   

  float strength = vUv.x; // from left to right (black to white)

  strength = 1.0 - strength; // from left to right (white to black)

  gl_FragColor = vec4(vec3(strength), 1.0);

}