module.exports = function (context, options) {
    return {
      name: 'custom-public-path',
  
      configureWebpack(config, isServer) {
        return {
          output: {
            publicPath: process.env.CDN_PATH, 
          },
        };
      },
    };
  };