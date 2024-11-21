precision mediump float;


// receiving uv coordinates from vertex shader because we sent them
varying vec2 vUv;


void main() {

  // ok, we have 10 segments here
  float strength = mod(vUv.x * 10.0, 1.0);


  // by imagining and looking what we learned about fragment shader, 
  // to be precise of how gpu calls this shader, we can conclude 
  // at the end that calling upper modulo numerous amount of time with
  // different vUv.x value will produce values in a way that
  // for example when vUv.x is in range of 0.0 to 0.1 will produce
  // same values when vUv is in range let's say from 0.5 to 0.6

  // than it is easy to imagine how we will have 10 segments  
  
  
  // and here, we need to imagine and see one important thing

  // this piece of code will end up:
  // - painting half of the one segment with black color
  // - painting other half of the segment with white color

  // it is very simple to see this now

  if(strength < 0.5) {
    strength = 0.0;
  }else{
    strength = 1.0;
  }

  // so at the end we will have 20 segments or it will look like it
  // since we painted half of the segment in white and other half in black 
  
  gl_FragColor = vec4(vec3(strength), 1.0);

  // in next lesson we will lower the number of segments since we want to have
  // 10 in total, no matter how they are painted


}