db.getCollection('companydrives').find({
  driveDate: {
    $gte: '2020-10-15',
    $lte: '2020-10-31'
  }
});