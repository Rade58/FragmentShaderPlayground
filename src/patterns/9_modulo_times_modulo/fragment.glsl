precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // we have two strenghts here
  // one uses vUv.x, and other vUv.y
  float strengthX = mod(vUv.x * 10.0, 1.0);
  float strengthY = mod(vUv.y * 10.0, 1.0);


  // we will esentially have something similar like
  // in last example
  // but the gradient will be different

  float strength = strengthX * strengthY;

  // we will have repeting segments over x axis
  // and repeating segments over y axis
  // which will look like they are crossing each other
  // same a in previous example

  // just gradient will be different 
  // it will still be diagonal but different
  // an different in a sense where
  // black strats and where white starts

  // we can try to invert them
  strength = 1.0 - strength;
  
  // also this one is cool
  strength = strengthX / strengthY;

  // but by offsetting some value it looks even cooler
  strength += 0.3;
  
  gl_FragColor = vec4(vec3(strength), 1.0);


}