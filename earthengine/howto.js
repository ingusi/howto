reduceRegion(ee.Reducer.frequencyHistogram()) //compute number of distinct values in a histogram
reduceRegion(ee.Reducer.sum().grouped(1)) //use raster zonal area (zonal stats) to realize sum, max value calculation

var fc = (ee.FeatureCollection('ft:1Ec8IWsP8asxN-ywSqgXWMuBaxI6pPaeh6hC64lA')
      .filter(ee.Filter().eq('ECO_NAME', 'Sonoran desert')));

//add lon, lat bands to img      
img = img.addBands(ee.Image.pixelLonLat());

//paint a feature collection onto an image, color by the attribute "ID" (note: not tested)
https://groups.google.com/d/msg/google-earth-engine-developers/_OBrauG-mQU/_tZL09nWbfwJ
var img = ee.Image().byte().paint(fc, "ID");

//masking
.updateMask() //only masks out currenly unmasked pixels
.unmask() // turns any currently masked pixels into a value, 0 by default. can pass a value in

ic.filter(ee.Filter.listContains("system:band_names", "N")) //filter by band name. band names are not in metadata but can filter by this property
//https://code.earthengine.google.com/8a983033d4fff873f5a647e6cfab857f

//---- date/time ----

//both of these formats can be parsed natively by ee
print(ee.Date('2014-06-02'));
print(ee.Date('2014-06-02T05:50:06Z'));
