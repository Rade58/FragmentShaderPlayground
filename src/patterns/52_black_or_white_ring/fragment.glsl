// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


// #define PI 3.1415926535897932384626433832795


// we copied this from somewhere
vec2 rotate(vec2 uv, float rotation, vec2 mid){
  return vec2(
    cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
    cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
  );
}



void main() {

  vec2 center = vec2(0.5);

  // like the previous example but we add step

  float strength = step(0.01, abs(distance(vUv, center) - 0.25));

  strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}