// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


// #define PI 3.1415926535897932384626433832795






void main() {

  // these are here so you can change them to get
  // another result
  float amplitude = 0.1;
  float frequency = 30.0;


  vec2 center = vec2(0.5);

  // creating new coordinate where we will modify
  // one of them with offset that will be sinus function value
  vec2 wavedUv = vec2(
    vUv.x,
    // inside sinus we will use x value
    vUv.y + sin(vUv.x * frequency) * amplitude
  );

  // instead vUv, we will use wavedUv
  float strength = step(0.01, abs(distance(wavedUv, center) - 0.25));

  strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}