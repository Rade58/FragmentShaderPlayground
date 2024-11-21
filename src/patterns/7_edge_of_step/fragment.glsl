precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // 5 segments at the beggining (after step usage, w will have 10 segments)
  float strength = mod(vUv.x * 10.0 / 2.0, 1.0);

  // our edge is 0.5 which we use most of the time
  // which at the end paints sagment to have one side black
  // and other side white
  // and ****  both sides have equal size ***
  //    strength = step(0.5, strength);

  // lowering edge we will have bigger white region on a segment
  //    strength = step(0.1, strength);

  // increasing edge we will have bigger black region on a segment
  strength = step(0.9, strength);


  gl_FragColor = vec4(vec3(strength), 1.0);

  

}