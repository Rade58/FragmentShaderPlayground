// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;



// same as previous example but we hardcoded pi
// float PI = 3.1415926535897932384626433832795;
// which we are going to use while calling rotate
// but it is better to be saved as define
// since it is cheaper than using variables
#define PI 3.1415926535897932384626433832795
// no semicolon after it, as you can see
// this is use when we want to define constant, 
// a something that doesn't change


// we copied this from somewhere
vec2 rotate(vec2 uv, float rotation, vec2 mid){
  return vec2(
    cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
    cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
  );
}



void main() {

  vec2 center = vec2(0.5);

  // we use our PI here
  
  vec2 rotatedUv = rotate(vUv, PI/4.0 , center);


  vec2 lightUvX = vec2(rotatedUv.x, (rotatedUv.y - 0.5) * 5.0 + 0.5);
  float lightX = 0.15 / distance(lightUvX, center);

  vec2 lightUvY = vec2(rotatedUv.y, (rotatedUv.x - 0.5) * 5.0 + 0.5);
  float lightY = 0.15 / distance(lightUvY, center);


  float strength = lightX * lightY;

  // strength = 1.0 - strength;

  gl_FragColor = vec4(vec3(strength), 1.0);

}