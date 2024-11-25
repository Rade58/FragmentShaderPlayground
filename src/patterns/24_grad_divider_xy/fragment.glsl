precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  
  vec2 center = vec2(0.5);

  // we added these two
  float strengthX = abs(vUv.x - center.x);
  float strengthY = abs(vUv.y - center.y);

  // and strenghth is now combination of these two
  float strength = strengthX * strengthY;

  // we can try different operations
  strength = strengthX / strengthY;
  strength = strengthX - strengthY;
  strength = strengthX + strengthY;


  gl_FragColor = vec4(vec3(strength), 1.0);


}