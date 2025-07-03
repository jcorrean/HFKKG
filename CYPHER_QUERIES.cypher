// CYPHER QUERIES
CREATE CONSTRAINT FOR (a:Author) REQUIRE a.username IS UNIQUE;
CREATE CONSTRAINT FOR (m:Model) REQUIRE m.model_id IS UNIQUE;
CREATE CONSTRAINT FOR (d:Dataset) REQUIRE d.dataset_id IS UNIQUE;
CREATE CONSTRAINT FOR (s:Space) REQUIRE s.space_id IS UNIQUE;

// Cargar Nodos Author
LOAD CSV WITH HEADERS FROM 'file:///authors.csv' AS row
CREATE (a:Author {username: row.`username:ID(Author)`, fullname: row.fullname, avatar_url: row.avatar_url, is_pro: toBoolean(row.is_pro), type: row.type, source: row.source});

// Cargar Nodos Model
LOAD CSV WITH HEADERS FROM 'file:///models.csv' AS row
CREATE (m:Model {model_id: row.`model_id:ID(Model)`, pipeline_tag: row.pipeline_tag, downloads: toInteger(row.downloads), likes: toInteger(row.likes), library_name: row.library_name, config: row.config});

// Cargar Nodos Dataset
LOAD CSV WITH HEADERS FROM 'file:///datasets.csv' AS row
CREATE (d:Dataset {dataset_id: row.`dataset_id:ID(Dataset)`, description: row.description, citation: row.citation, paperswithcode_id: row.paperswithcode_id, downloads: toInteger(row.downloads)});

// Cargar Nodos Space (creados a partir de los IDs únicos de las relaciones)
LOAD CSV WITH HEADERS FROM 'file:///spaces.csv' AS row
CREATE (s:Space {space_id: row.`space_id:ID(Space)`});