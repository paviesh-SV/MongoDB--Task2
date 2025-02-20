db.getCollection('codekata').aggregate(
  [
    {
      $group: {
        _id: 'Total Problem Solved By Users',
        count: { $sum: '$problemSolved' }
      }
    }
  ],
  { maxTimeMS: 60000, allowDiskUse: true }
);