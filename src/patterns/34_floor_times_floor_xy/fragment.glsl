// already defined with ShaderMaterial
// precision mediump float;

// we did receive this from vertex shader, because we did send it (not done by ShaderMaterial)
varying vec2 vUv;


void main() {

  
 
  // we will have both floor results, one we built with x and other with y
  float strengthX = floor(vUv.x * 10.0) / 10.0;
  float strengthY = floor(vUv.y * 10.0) / 10.0;

  // we will multiply the values
  float strength = strengthX * strengthY;

  // entire space will devided in perfect rectangles 10 x 10
  // and rectangles will have nucances of gray
  // which will change diagonally

  // bottom left is black rectangle and top right is white rectangle  

  gl_FragColor = vec4(vec3(strength, strength, strength), 1.0);

}