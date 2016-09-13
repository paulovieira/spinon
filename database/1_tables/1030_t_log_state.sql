DO $$

DECLARE
patch_exists int := _v.register_patch('premiere-t_log_state-XXXX', 'initial database design for XXXX');

BEGIN

IF patch_exists THEN
    RETURN;
END IF;

/*** BEGIN CODE FOR CHANGES  ***/

-- this is a replica of the table in the local server
create table t_log_state_XXXX( 
    id int primary key,

    event jsonb,
    ts_start timestamptz not null default now(),
    ts_end timestamptz not null default now(),

    sync jsonb default '{}'
);

/*** END CODE FOR CHANGES  ***/

END;
$$;