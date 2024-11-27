// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



void main() {



  vec2 center = vec2(0.5);

  vec2 lightUvX = vec2(vUv.x, (vUv.y - 0.5) * 5.0 + 0.5);
  // this is something we used in previous example
  float lightX = 0.15 / distance(lightUvX, center);

  vec2 lightUvY = vec2(vUv.y, (vUv.x - 0.5) * 5.0 + 0.5);
  float lightY = 0.15 / distance(lightUvY, center);


  float strength = lightX * lightY;

  // strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}