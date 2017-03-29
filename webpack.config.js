const webpack = require('webpack');
var path = require("path");

module.exports = {
  context: __dirname,
  entry: './frontend/cafehub.jsx',
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: 'bundle.js',
  },
  module: {
    loaders: [{
      test: [/\.jsx?$/, /\.js?$/],
      exclude: /(node_modules)/,
      loader: 'babel',
      query: {
        presets: ['es2015', 'react']
      }
    }, {
      test: /\.png$/,
      loader: "url-loader?mimetype=image/png"
    }]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['', '.js', '.jsx']
  }
  // plugins: [
  //   new webpack.DefinePlugin({
  //     'process.env': {
  //       NODE_ENV: JSON.stringify('production')
  //     }
  //   }),
  //   new webpack.optimize.UglifyJsPlugin()
  // ]
};
