precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // added offset here, so change it and see what will happen 
  float offset = 0.2;
  //
  
  vec2 center = vec2(0.5);


  float strengthX = abs(vUv.x - center.x);
  float strengthY = abs(vUv.y - center.y);

  // used offset here
  float strength = strengthX + strengthY - offset;

  // try these also with offset to see what you'll get
  // strength = strengthX / strengthY + offset;
  // strength = strengthX - strengthY + offset;
  // strength = strengthX * strengthY  + offset;


  gl_FragColor = vec4(vec3(strength), 1.0);


}