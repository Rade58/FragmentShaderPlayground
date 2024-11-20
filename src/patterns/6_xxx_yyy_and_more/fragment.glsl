precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {


           
  
  vec3 strength = vUv.xxx;  // yes, it's a vec3

  strength = vUv.yyy;

  // but there are also combinations as you wish
  // you can build vec3 that has this kind of combinations
  strength = vUv.xyx;  // again this will indtroduce color
  //                      other than black and white
  //                      some color will be part of the gradient
  

  strength = vUv.yyx;


  gl_FragColor = vec4(strength, 1.0);
}