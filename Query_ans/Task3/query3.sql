db.getCollection('companydrives').aggregate(
  [
    {
      $lookup: {
        from: 'users',
        localField: 'userId',
        foreignField: 'userId',
        as: 'studentInfo'
      }
    },
    {
      $project: {
        _id: 0,
        'studentInfo.userName': 1,
        company: 1,
        driveDate: 1,
        'studentInfo.userEmail': 1,
        'studentInfo.userId': 1
      }
    }
  ],
  { maxTimeMS: 60000, allowDiskUse: true }
);