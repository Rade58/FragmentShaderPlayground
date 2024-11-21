precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // this will produce lighter segments
  float strength = mod(vUv.x * 10.0, 1.0);

  // I already showed this in previous example but lets look at it
  // again

  // but this is going to produce darker segment
  // you will have 10 darker segments
  strength = mod(vUv.x, 0.1);

  // in this case, the smaller the second argument
  // the more segments you will have

  // this is 20 segments
  strength = mod(vUv.x, 0.1 / 2.0);

  // but now to acomplish different direction
  // don't substract from one
  // substract from 0.1 like this 
  strength = 0.1 - strength;

  
  gl_FragColor = vec4(vec3(strength), 1.0);

}