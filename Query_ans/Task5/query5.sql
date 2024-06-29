db.mentors.aggregate(
  [{ $match: { menteeCount: { $gt: 15 } } }]
);