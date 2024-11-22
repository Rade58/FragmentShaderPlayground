precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // we have two modulos
  // if we would add or multiply these we would get
  // 5 segments that cross eachother
  // or to be precise we would get 5 times 5 which is 25
  // segments containing same diagonal gradient
  // which we already did in two previous examples
  float strengthX = mod(vUv.x * 10.0/ 2.0, 1.0);
  float strengthY = mod(vUv.y * 10.0/ 2.0, 1.0);

  // what if we want to use step
  // and We know that we used step before to
  // have segments but that every other segment is different
  // that one is white and that othe r is black and so on

  // well by adding step results together
  // we will get something that looks like
  // crossing barss (I lack the right word to explain it
  // so better see it yourself)

  // I think people call this a grid

  
  // this will create black rectangles on white surface
  float strength = step(0.5, strengthX) + step(0.5, strengthY);
  // that is how it would look

  // to have white rectangles on a black surface
  // we would invert it like this
  strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);


}