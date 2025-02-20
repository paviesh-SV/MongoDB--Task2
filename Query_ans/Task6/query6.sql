db.attendence.aggregate(
  [
    {
      $lookup: {
        from: 'topics',
        localField: 'topicId',
        foreignField: 'topicId',
        as: 'Absent'
      }
    },
    {
      $lookup: {
        from: 'tasks',
        localField: 'userId',
        foreignField: 'userId',
        as: 'Task-notSubmitted'
      }
    },
    { $unwind: '$Task-notSubmitted' },
    { $unwind: '$Absent' },
    {
      $match: {
        attended: false,
        'Absent.topicDate': {
          $gte: '2020-10-15',
          $lte: '2020-10-31'
        }
      }
    },
    {
      $match: {
        'Task-notSubmitted.dueDate': {
          $gte: '2020-10-15',
          $lte: '2020-10-31'
        },
        'Task-notSubmitted.submitted': false
      }
    },
    { $project: { _id: 0, 'Absent._id': 0 } },
    { $project: { 'task-notSubmitted._id': 0 } }
  ]
);