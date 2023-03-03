local id = 'USGS/NLCD_RELEASES/2019_REL/RCMAP/V5/TRENDS';
local subdir = 'USGS/NLCD_RELEASES';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';
local license = spdx.cc0_1_0;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;
local catalog_subdir_url = ee_const.catalog_base + subdir + '/';
local parent_url = catalog_subdir_url + 'catalog.json';
local self_url = catalog_subdir_url + base_filename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
    ee_const.ext_ver,
  ],
  id: id,
  title: 'RCMAP Rangeland Component Timeseries V5 Trends (1985-2021)',
  version: 'V5',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    Currently available trends statistics are for the 1985-2021 time-series.

    The RCMAP product suite includes nine fractional components: annual herbaceous, 
    bare ground, herbaceous, litter, non-sagebrush shrub, perennial herbaceous, sagebrush,
    shrub, and tree, rule-based error maps, and the temporal trends of each component. Data 
    characterize the percentage of each 30-meter pixel in the Western United States covered
    by each component for each year from 1985-2021 - providing change information for 36 
    years.

    We assess the temporal patterns in each RCMAP component with two approaches, 1) linear trends
    and 2) a breaks and stable states method with an 8-year temporal moving window based on structural
    change at the pixel level. Linear trend products include slope and p-value calculated from 
    least squares linear regression. The slope represents the average percent cover change per 
    year over the times-series and the p-value reflects the confidence of change in each pixel.
    The structural change method partitions the time-series into segments of similar slope values,
    with statistically significant break-points indicating perturbations to the prior trajectory. 
    The break point trends analysis suite relies on structural break methods, resulting in the 
    identification of the number and timing of breaks in the time-series, and the significance of
    each segment. We produce the following statistics: 1) for each component, each year, the 
    presence/absence of breaks, 2) the slope, p-value, and standard error of the segment occurring
    in each year, 3) the overall model R2 (quality of model fit to the temporal profile), and 
    4) an index, Total Change Intensity. This index reflects the total amount of change occurring
    across components in that pixel. The linear and structural change methods generally agreed on 
    patterns of change, but the latter found breaks more often, with at least one break point in 
    most pixels. The structural change model provides more robust statistics on the significant 
    minority of pixels with non-monotonic trends, while detrending some interannual signal 
    potentially superfluous from a long-term perspective. Trends products can be downloaded from the
    [Multi-Resolution Land Characteristics Consortium](https://www.mrlc.gov/data).

    See also:

    * Rigge, M., C. Homer, L. Cleeves, D. K. Meyer, B. Bunde, H. Shi, G. Xian,
      S. Schell, and M. Bobo. 2020. Quantifying western U.S. rangelands as
      fractional components with multi-resolution remote sensing and in situ
      data. Remote Sensing 12.
      [doi:10.3390/rs12030412](https://doi.org/10.3390/rs12030412)

    * Rigge, M., C. Homer, H. Shi, D. Meyer, B.
      Bunde, B. Granneman, K. Postma, P. Danielson, A. Case, and G. Xian. 2021.
      Rangeland Fractional Components Across the Western United States
      from 1985 to 2018. Remote Sensing 13:813.
      [doi:10.3390/rs13040813](https://doi.org/10.3390/rs13040813)
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'climate_change',
    'disturbance',
    'landsat_derived',
    'nlcd',
    'rangeland',
    'trends',
  ],
  providers: [
    ee.producer_provider(
      'United States Geological Survey and Bureau of Land Management',
      'https://www.mrlc.gov/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(
      -125.0683594, 28.45903302, -101.0742188, 49.32512199,
      '1985-01-01T00:00:00Z',
      '2021-12-31T00:00:00Z'),
  'sci:citation': |||

    Rigge, M.B., Bunde, B., Postma, K., Shi, H., 2022, Rangeland Condition
    Monitoring Assessment and Projection (RCMAP) Fractional Component
    Time-Series Across the Western U.S. 1985-2021: U.S. Geological Survey data
    release.
    [doi:10.5066/P9ODAZHC](https://doi.org/10.5066/P9ODAZHC)
  |||,
  'gee:user_uploaded': true,
  'gee:terms_of_use': |||
    This work was authored as part of the Contributor's official duties as an
    Employee of the United States Government and is therefore a work of the
    United States Government. In accordance with 17 U.S.C. 105, no copyright
    protection is available for such works under U.S. Law. This is an Open
    Access article that has been identified as being free of known restrictions
    under copyright law, including all related and neighboring rights
    (https://creativecommons.org/publicdomain/mark/1.0/). You can copy, modify,
    distribute and perform the work, even for commercial purposes, all without
    asking permission.
  |||,
  'gee:interval': {
    type: 'cadence',
    unit: 'year',
    interval: 1,
  },
  summaries: {
    gsd: [
      30
    ],
    'gee:visualizations': [
      {
        display_name: 'bp_count integer',
        lookat: {
          lat: 38,
          lon: -114,
          zoom: 6,
        },
        image_visualization: {
          band_vis: {
            min: [
              0,
            ],
            max: [
              100,
            ],
            palette: [
              '000000',
              'f9e8b7',
              'f7e3ac',
              'f0dfa3',
              'eedf9c',
              'eada91',
              'e8d687',
              'e0d281',
              'ddd077',
              'd6cc6d',
              'd3c667',
              'd0c55e',
              'cfc555',
              'c6bd4f',
              'c4ba46',
              'bdb83a',
              'bbb534',
              'b7b02c',
              'b0ad1f',
              'adac17',
              'aaaa0a',
              'a3a700',
              '9fa700',
              '9aa700',
              '92a700',
              '8fa700',
              '87a700',
              '85a700',
              '82aa00',
              '7aaa00',
              '77aa00',
              '70aa00',
              '6caa00',
              '67aa00',
              '5fa700',
              '57a700',
              '52a700',
              '4fa700',
              '4aa700',
              '42a700',
              '3ca700',
              '37a700',
              '37a300',
              '36a000',
              '369f00',
              '349d00',
              '339900',
              '339900',
              '2f9200',
              '2d9100',
              '2d8f00',
              '2c8a00',
              '2c8800',
              '2c8500',
              '2c8400',
              '2b8200',
              '297d00',
              '297a00',
              '297900',
              '277700',
              '247400',
              '247000',
              '29700f',
              '2c6d1c',
              '2d6d24',
              '336d2d',
              '366c39',
              '376c44',
              '396a4a',
              '396a55',
              '3a6a5f',
              '3a696a',
              '396774',
              '3a6782',
              '39668a',
              '376292',
              '34629f',
              '2f62ac',
              '2c5fb7',
              '245ec4',
              '1e5ed0',
              '115cdd',
              '005ae0',
              '0057dd',
              '0152d6',
              '0151d0',
              '014fcc',
              '014ac4',
              '0147bd',
              '0144b8',
              '0142b0',
              '0141ac',
              '013da7',
              '013aa0',
              '01399d',
              '013693',
              '013491',
              '012f8a',
              '012d85',
              '012c82',
              '01297a'
            ],
            bands: [
              'bp_count',
            ],
          },
        },
      },
    ],
    'eo:bands': [
      {
        name: 'bp_count',
        description: 'Break Point Count',
        'gee:units': 'int8',
      },
      {
        name: 'pvalue_linear',
        description: 'P-Value of Linear Model',
        'gee:units': 'int8',
      },
      {
        name: 'slope_linear',
        description: 'Slope of Linear Model',
        'gee:units': 'int16',
      },
      {
        name: 'total_change_intensity_index',
        description: 'Total Change Intensity Index',
        'gee:units': 'int8',
      },
      {
        name: 'year_recent_break',
        description: 'Year of Most Recent Break',
        'gee:units': 'int16',
      },
      {
        name: 'bp_year',
        description: 'Break Point Presence/Absence in Each Year',
        'gee:units': 'int1',
      },
      {
        name: 'segment_pvalue',
        description: 'P-Value of Segment in Each Year',
        'gee:units': 'int8',
      },
      {
        name: 'segment_slope',
        description: 'Slope of Segment in Each Year',
        'gee:units': 'int16',
      },
    ],
    bp_count: {
      minimum: 0,
      maximum: 3,
      'gee:estimated_range': false,
    },
    pvalue_linear: {
      minimum: 0,
      maximum: 100,
      'gee:estimated_range': false,
    },
    slope_linear: {
      minimum: -383,
      maximum: 351,
      'gee:estimated_range': false,
    },
    total_change_intensity_index: {
      minimum: 0,
      maximum: 100,
      'gee:estimated_range': false,
    },
    year_recent_break: {
      minimum: 1986,
      maximum: 2019,
      'gee:estimated_range': false,
    },
    bp_year: {
      minimum: 0,
      maximum: 1,
      'gee:estimated_range': false,
    },
    segment_pvalue: {
      minimum: 0,
      maximum: 100,
      'gee:estimated_range': false,
    },
    segment_slope: {
      minimum: -6185,
      maximum: 5724,
      'gee:estimated_range': false,
    },
  },
}
