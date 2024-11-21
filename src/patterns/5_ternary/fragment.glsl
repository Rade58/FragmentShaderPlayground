precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {


  // here we multiply with 5.0 instead of 10.0, it will explain 
  // previous lesson so go there, but we do this to have
  // 5 segments at the beggining
  // since after we use logical statemt (ternary or if else)
  // the number of segments will double
  float strength = mod(vUv.x * 10.0 / 2.0, 1.0);


  
  // using ternary instead of if else
  strength = strength < 0.5 ? 0.0 : 1.0;
  

  gl_FragColor = vec4(vec3(strength), 1.0);

  

}