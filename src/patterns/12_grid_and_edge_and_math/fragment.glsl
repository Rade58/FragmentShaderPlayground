precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // idea between these exercise
  // is to show how rectagles change size as we change edge values
  // (or to be precise how mask dimension changes)
  // also we can see what happens with pattern as we
  // do matematical operations on two step results


  // now we want to parametarize the edge of our step functions
  // to see what will happen as we increse it/decrease it
  float edgeX = 0.5;
  float edgeY = 0.5;

  // instead of 0.5, let's change it to some other values and see what
  // would happen
  edgeX = 0.8;
  edgeY = 0.7;


  float grid_items = 10.0;


  float strengthX = mod(
    vUv.x * grid_items,
    1.0
  );
  float strengthY = mod(
    vUv.y * grid_items,
    1.0
  );

  float strength = step(edgeX, strengthX);
  
  // this is the part where we are doing different math with
  // results of step

  // we can trey different operatiosn to see what will happen
  // strength += step(edgeY, strengthY);
  // strength -= step(edgeY, strengthY);
  strength *= step(edgeY, strengthY);
  // strength /= step(edgeY, strengthY);



  // also we can try this
  // strength = 1.0 - strength;


  gl_FragColor = vec4(vec3(strength), 1.0);


}