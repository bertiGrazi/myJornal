const PostsController = require("../PostsController");

module.exports = {


  friendlyName: 'Create',


  description: 'Create post.',


  inputs: {
    title: {
      description: "Title of post object",
      type: "string",
      requeired: true
    },
    postBody: {
      type: "string",
      requeired: true
    }
  },


  exits: {

  },


  fn: async function (inputs) {
    await Post.create({title: inputs.title,  body: inputs.postBody})
    return;
  }
};
