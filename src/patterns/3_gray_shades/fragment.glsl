precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  float strength = 0.5; // all 3 same values that are not
  //                        0.0 or 1.0   makes a gray color

  // - bigger the number gray is     lighter
  // strength = 0.9;
  // - smaller the number gray is    darker
  // strength = 0.1;


  gl_FragColor = vec4(vec3(strength), 1.0);
}