precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // we multiplied coordinate
  float strength = vUv.x * 10.0;

  // strength       value can be above 1.0 for this reason

  // but how then we can pass value above 1.0 
  // to the red, green or blue
  // when we know that these can only be between 0.0 and 1.0

  // gl_FragColor = vec4(vec3(strength), 1.0);
  // VALUES ABOVE 1.0 WILL BE AUTOMATICALLY CLAMPED TO 1.0
  // AND VALUES BELLOW 0.0 WILL BE AUTOMATICALLY CLAMPED TO BE 0.0


  // so in this case for example    -10.0   would be clamped to  0.0
  gl_FragColor = vec4(vec3(-10.0), 1.0);
  // and color would be entirely black

}