CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child 
    FROM dogs, parents 
    WHERE parent = name 
    ORDER BY -height;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size
    FROM dogs, sizes
    WHERE height > min and height <= max;


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT a.child AS first_name, b.child AS second_name, first_size.size AS size
    FROM parents AS a, parents AS b, size_of_dogs AS first_size, size_of_dogs AS second_size
    WHERE a.child < b.child and a.parent = b.parent and first_size.name = a.child and second_size.name = b.child and first_size.size = second_size.size;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || first_name || " and " || second_name || ", have the same size: " || size
    FROM siblings;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur AS fur, max(height) - min(height) AS height_range
    FROM dogs
    GROUP BY fur
    HAVING max(height) <= 1.3 * AVG(height) and min(height) >= 0.7 * AVG(height);

