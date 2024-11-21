precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // ***** USING if else OR ternary IS BAD FOR PERFORMANCE
  // ***** SO WE WILL USE step INSTEAD
  // ***** step PRODUCES 0.0 OR 1.0 BY DEFAULT
  // ***** DEPENDING OF THE EDGE (FIRST ARGUMENT)
  // ***** AND DEPENDING OF THE VALUE (SECOND ARGUMENT)
  // ***** SECOND ARGUMENT HIGHER THAN EDGE, WILL PRODUCE 1.0
  // ***** SECOND ARGUMENT LOWER OR EQUALTHAN EDGE, WILL PRODUCE 0.0


  float strength = mod(vUv.x * 10.0 / 2.0, 1.0);


  
  // so this
  strength = step(0.5, strength);
  // pretty much is same as this
  // strength = strength < 0.5 ? 0.0 : 1.0;

  // and in future we will use only step instead of
  // if else or ternary

  // we will only use ternary or if else when we really need to
  

  gl_FragColor = vec4(vec3(strength), 1.0);

  

}