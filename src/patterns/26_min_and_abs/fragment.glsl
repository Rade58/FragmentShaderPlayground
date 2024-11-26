precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  
  vec2 center = vec2(0.5);


  float strengthX = abs(vUv.x - center.x);
  float strengthY = abs(vUv.y - center.y);

  // so the lower value than the other value will be
  // the result
  float strength = min(strengthX, strengthY);

  
  // so you will again have some "diamond pyramidic" gradient
  // since when gpu executes this shader,
  // sometimes first value is bigger than the second or vice versa
  // and we get some gradiet that goes in all 4 dirrections 


  gl_FragColor = vec4(vec3(strength), 1.0);

}