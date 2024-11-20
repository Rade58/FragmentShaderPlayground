precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {


  // substracting vectors from 1.0 is also possible
  // it will create new vector where every coordinate is
  // is made with original value being substracted from one

  //  --- also other matematical operations are possible ---
  // you can do some offsets if you like
   

  vec2 strength = vUv.xy; // as you can se its vec2
 
  strength = 1.0 - strength;    // we can do matematical 
  //                            operations with vectors like this

  // doing some kind of offset here
  strength -= 0.5;


  gl_FragColor = vec4(vec3(strength, 0.0), 1.0);

}