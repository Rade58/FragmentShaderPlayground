precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // so you will have black in the middle
  // which will divide plane on the middle
  // and gradient that goes towards white 
  // to the left and to the right side

  // so, coordiantes go from 0.0 to 1.0
  // but to accomplish this we need something to go from -0.5 to 0.5

  // as you remeber, if we pass values bellow 0.0 to the final vector
  // value is clamped to 0.0, and if we pass values above 1.0, value
  // is clamped to the 1.0

  // also we know that center is 0.5, 0.5

  // I will define vec2 for the center, since in some latter example
  // I want to use entire vector, but now I'm just going to use
  // one coordinate
  vec2 center = vec2(0.5);

  // as I said we need to use abs function
  // because we need absolute value, we can't have negative values 
  float strength = abs(vUv.x - center.x);

  // you can try dividing the plane over y (vertical black line in the middle)

  strength = abs(vUv.y - center.y);


  gl_FragColor = vec4(vec3(strength), 1.0);


}