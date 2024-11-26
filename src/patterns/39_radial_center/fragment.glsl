// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {

  // we will introduce center again
  vec2 center = vec2(0.5);

  // we will substract the center from current uv coordinate
  float distanceFromZero = length(vUv - center);
  // this would also be valid    length(vUv - 0.5)  it would
  //                                                  do the same thing
  //                                                which is substract
  //                                                0.5 from both
  //                                                uv coords
  //                                          but I like syntax with
  //                                          center


  // which will create circular gradient with center in (0.5, 0.5)
  // and most black will be in that center

  float strength = distanceFromZero;


  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}