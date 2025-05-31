export default {
  multipass: true,
  plugins: [
    {
      name: "preset-default",
      params: {
        overrides: {
          removeViewBox: false,
          convertShapeToPath: false,
        },
      },
    },
    "removeDimensions",
    "convertStyleToAttrs",
    "removeOffCanvasPaths",
    "removeRasterImages",
    {
      name: "removeAttrs",
      params: {
        attrs: [
          "path:style",
          "font-*",
          "font-size",
          "font-weight",
          "font-family",
          "-inkscape-*",
          "line-height",
          "stroke-width",
        ],
        elemSeparator: ":",
        preserveCurrentColor: false,
      },
    },
  ],
};
