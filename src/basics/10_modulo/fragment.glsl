precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // we all know what modulo is
  // we know that we need to pass a dividend and a divisor
  // we know that modulo produces    -reminder-

  // most of the time we use modulo to divide by 2.0
  // to get odd and even numbers, BUT NOT IN HERE
  // in here we use it to divide something into
  // segments and apply same color pattern
  // to each of segments

  // formula: mod(x,y) = x - y * floor(x/y)

  // you can try just to memorize this
  // because most of the time you will use it like this

  // 
  float strength = mod(vUv.x * 10.0, 1.0);

  gl_FragColor = vec4(vec3(strength), 1.0);

}