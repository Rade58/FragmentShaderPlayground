// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {



  vec2 center = vec2(0.5);

  // instead of multiplying
  // float strength = distance(vUv, center) * 10.0;
  // we can divide instead
  float strength = 0.01 / distance(vUv, center) * 10.0;
  // also try with 0.015 and 0.030 for example
  // also try to add 0.25 to the entire thing to see
  // the limit of the plane if you want it
  // problem wuth this is you will never have reached zero value
  // in terms of coordinates and edge of the plane will be visible
  // which is not ideal if you want to display something
  // that looks like a star for example
  // black of the background and edge of the plane will be different
  // colors which is not ideal



  // you can try substracting also
  strength = 1.0 - strength;

 

  gl_FragColor = vec4(vec3(strength), 1.0);

}