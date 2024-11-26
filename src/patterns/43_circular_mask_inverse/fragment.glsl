// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {



  vec2 center = vec2(0.5);

  float strength = step(0.25, distance(vUv, center));

  // we will just substract from 1.0, a result we defined in previous
  // lesson
  strength = 1.0 - strength;

  // you will get circular mask patten
  // but now circle is white and everything
  // around is black

  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}