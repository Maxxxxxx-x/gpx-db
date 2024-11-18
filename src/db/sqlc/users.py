# Code generated by sqlc. DO NOT EDIT.
# versions:
#   sqlc v1.27.0
# source: users.sql
from typing import AsyncIterator, Iterator, Optional

import sqlalchemy
import sqlalchemy.ext.asyncio

from gpx_data import models


DELETE_USER_BY_ID = """-- name: delete_user_by_id \\:exec
DELETE FROM Users WHERE Id = :p1
"""


DELETE_USERS = """-- name: delete_users \\:exec

DELETE FROM Users
"""


GET_USER_BY_ID = """-- name: get_user_by_id \\:one
SELECT id FROM Users WHERE Id = :p1 LIMIT 1
"""


GET_USERS = """-- name: get_users \\:many
SELECT id FROM Users
"""


INSERT_USER = """-- name: insert_user \\:one
INSERT INTO Users (
    Id
) VALUES (
    :p1
) RETURNING id
"""


class Querier:
    def __init__(self, conn: sqlalchemy.engine.Connection):
        self._conn = conn

    def delete_user_by_id(self, *, id: str) -> None:
        self._conn.execute(sqlalchemy.text(DELETE_USER_BY_ID), {"p1": id})

    def delete_users(self) -> None:
        self._conn.execute(sqlalchemy.text(DELETE_USERS))

    def get_user_by_id(self, *, id: str) -> Optional[str]:
        row = self._conn.execute(sqlalchemy.text(GET_USER_BY_ID), {"p1": id}).first()
        if row is None:
            return None
        return row[0]

    def get_users(self) -> Iterator[str]:
        result = self._conn.execute(sqlalchemy.text(GET_USERS))
        for row in result:
            yield row[0]

    def insert_user(self, *, id: str) -> Optional[str]:
        row = self._conn.execute(sqlalchemy.text(INSERT_USER), {"p1": id}).first()
        if row is None:
            return None
        return row[0]


class AsyncQuerier:
    def __init__(self, conn: sqlalchemy.ext.asyncio.AsyncConnection):
        self._conn = conn

    async def delete_user_by_id(self, *, id: str) -> None:
        await self._conn.execute(sqlalchemy.text(DELETE_USER_BY_ID), {"p1": id})

    async def delete_users(self) -> None:
        await self._conn.execute(sqlalchemy.text(DELETE_USERS))

    async def get_user_by_id(self, *, id: str) -> Optional[str]:
        row = (await self._conn.execute(sqlalchemy.text(GET_USER_BY_ID), {"p1": id})).first()
        if row is None:
            return None
        return row[0]

    async def get_users(self) -> AsyncIterator[str]:
        result = await self._conn.stream(sqlalchemy.text(GET_USERS))
        async for row in result:
            yield row[0]

    async def insert_user(self, *, id: str) -> Optional[str]:
        row = (await self._conn.execute(sqlalchemy.text(INSERT_USER), {"p1": id})).first()
        if row is None:
            return None
        return row[0]
