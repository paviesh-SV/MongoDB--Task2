db.getCollection('topics').aggregate(
  [
    {
      $lookup: {
        from: 'Tasks',
        localField: 'topic',
        foreignField: 'task',
        as: 'Topic Task Data'
      }
    },
    {
      $match: { topicDate: { $regex: '2020-10' } }
    },
    {
      $project: {
        _id: 0,
        topic: 1,
        topicDate: 1,
        'Topic Task Data.userId': 1,
        'Topic Task Data.submitted': 1,
        'Topic Task Data.task': 1
      }
    }
  ],
  {maxTimeMS: 60000, allowDiskUse: true }
);