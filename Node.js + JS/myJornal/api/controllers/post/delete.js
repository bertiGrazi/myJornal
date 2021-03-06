const PostsController = require("../PostsController");

module.exports = {


  friendlyName: 'Delete',


  description: 'Delete something.',


  inputs: {
    postId: {
      type: "string",
      required: true
    }
  },


  exits: {
    invalid: {
      description: "This was an invalid post to delete"
    }
  },


  fn: async function (inputs) {
    const record = await Post.destroy({ id: inputs.postId }).fetch()
    if (record.length == 0) {
      throw ({ invalid: { error: "Record does not exist" } })
    }
    return record;
  }
};
