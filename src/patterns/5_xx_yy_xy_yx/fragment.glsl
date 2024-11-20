precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {


  // since in end result we don't have same values
  // for red green and blue
  // it won't be grayscale since some color (in our case red)
  // will have different value most of the time
  // in some call of this fragment shader it will probably
  // get to have same value but since red is always 0.5
  // you will see redish color as a part of the gradient          
  
  vec2 strength = vUv.xx;  // yes, it's a vec2

  // strength = vUv.yy;

  // strength = vUv.xy;    

  // strength = vUv.yx;

  gl_FragColor = vec4(0.5, strength, 1.0);
}