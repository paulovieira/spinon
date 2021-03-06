DO $$

DECLARE
patch_exists int := _v.register_patch('premiere-t_measurements-XXXX', 'initial database design - XXXX');

BEGIN

IF patch_exists THEN
    RETURN;
END IF;

/*** BEGIN CODE FOR CHANGES  ***/

/* 
this is a replica of the table in the local server;

the difference to the respective table in the local server is that id is not serial 
(and also sync is json here while in local is just a bool, but that will change)
*/

create table t_measurements_XXXX(
	id int primary key,

	mac text not null,
    sid smallint not null,
    type text not null,
    description text,
    val real,

    ts timestamptz not null default now(),
    battery smallint,
    agg bool default false,
    sync jsonb default '{}'
);

/*** END CODE FOR CHANGES  ***/

END;
$$;




DO $$

DECLARE
patch_exists int := _v.register_patch('160916-1-XXXX', 'drop the column "agg" in t_measurements - XXXX');

BEGIN

IF patch_exists THEN
    RETURN;
END IF;

/*** BEGIN CODE FOR CHANGES  ***/

alter table t_measurements_XXXX
drop column agg cascade;

/*** END CODE FOR CHANGES  ***/

END;
$$;


