// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {



  vec2 center = vec2(0.5);

  // this will be our starting point
  //        float strength = step(0.25, distance(vUv, center));
  //        gl_FragColor = vec4(vec3(strength), 1.0);
  // which is previus example
  // but we will parametarize things even more

  // this time  instead of returned value that would be
  // float which we did offten through our examples
  //      float strength = mod(vUv.y * 10.0, 1.0);
  // we can use returned value that is vec2
  // because indeed, returned value can be vec2
  // if we use vec2 as an argument
  vec2 pos = mod(vUv * 10.0, 1.0);

  // this time here we use new vec2 as first argument 
  float d = distance(pos, center);

  // and here finally we use step
  float mask = step(0.25, d);

  
  // this just because we don't want to stop tradition of using
  // strength variable in final value
  float strength = mask;


  // we will get grid of 10 x 10 black circles on white background

  // we can invert it at the end to have
  // white circles on black background
  strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);
}