-- Enable the pgvector extension
create extension if not exists vector;

-- Create the documentation chunks table
create table knowledge_base (
    id bigserial primary key,
    url varchar not null,
    chunk_number integer not null,
    title varchar not null,
    summary varchar not null,
    content text not null,  -- Added content column
    metadata jsonb not null default '{}'::jsonb,  -- Added metadata column
    embedding vector(1536),  -- OpenAI embeddings are 1536 dimensions
    created_at timestamp with time zone default timezone('utc'::text, now()) not null,
    
    -- Add a unique constraint to prevent duplicate chunks for the same URL
    unique(url, chunk_number)
);

-- Create an index for better vector similarity search performance
create index on knowledge_base using ivfflat (embedding vector_cosine_ops);

-- Create an index on metadata for faster filtering
create index idx_knowledge_base_metadata on knowledge_base using gin (metadata);

-- Create a function to search for documentation chunks
create function match_knowledge_base (
  query_embedding vector(1536),
  match_count int default 10,
  filter jsonb DEFAULT '{}'::jsonb
) returns table (
  id bigint,
  url varchar,
  chunk_number integer,
  title varchar,
  summary varchar,
  content text,
  metadata jsonb,
  similarity float
)
language plpgsql
as $$
#variable_conflict use_column
begin
  return query
  select
    id,
    url,
    chunk_number,
    title,
    summary,
    content,
    metadata,
    1 - (knowledge_base.embedding <=> query_embedding) as similarity
  from knowledge_base
  where metadata @> filter
  order by knowledge_base.embedding <=> query_embedding
  limit match_count;
end;
$$;

-- Everything above will work for any PostgreSQL database. The below commands are for Supabase security

-- Enable RLS on the table
alter table knowledge_base enable row level security;

-- Create a policy that allows anyone to read
create policy "Allow public read access"
  on knowledge_base
  for select
  to public
  using (true);