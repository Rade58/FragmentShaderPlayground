// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


void main() {

  
  // this would be normal gradient that is changing
  // over x axis
  float strength = vUv.x;

  // but let's say we don't want gradient
  // we want to have shades of gray in between black and white
  // we want those colors to be sharply separated

  // now you can use round  (available only when using ShaderMaterial
  //                        not available when using RawShaderMaterial)
  // this will create 10 division and each will have some gray nuance
  strength = round(vUv.x * 10.0) / 10.0;

  // play around and change above numbers 10.0 and 10.0 divisor
  // see what will you get


  // one problem you'll see
  // last segment which is white color is narrower than the rest


  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}