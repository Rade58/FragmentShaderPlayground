precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // ** THIS WILL ONLY WORK IF OUR edge ARGUMENTS FOR step
  // ARE BOTH THE SAME VALUES**
  // so I isolate it here
  float edge = 0.5;



  // well my grid from previous example isn't centered
  // which means rectangles touch sides of the plane


  // to create better looking grid I parametarized some things
  // I want to have this much rectangles
  float grid_items = 10.0;  // this is number of grid items by row or column
  // we can change this number above anytime we want more items by row/column


  // center of the plane
  // you will se why we use this  
  vec2 center = vec2(0.5, 0.5);

  // I didnt came to the final result in a rational way
  // I just try doing this kind of math on these values (divisions bellow)
  // and it worked
  vec2 newvUv = vUv - center / grid_items / 2.0;

  // esencially because of this above,
  // we will center our grid

  // if you forgotm this is how we get repeting patterns
  float strengthX = mod(
    newvUv.x * grid_items,
    1.0
  );
  float strengthY = mod(
    newvUv.y * grid_items,
    1.0
  );

  float strength = step(edge, strengthX) + step(edge, strengthY);

  // to have white rectangles on black surface
  // strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);


}