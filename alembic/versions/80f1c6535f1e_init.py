"""init

Revision ID: 80f1c6535f1e
Revises: 
Create Date: 2022-07-25 15:12:47.765716

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '80f1c6535f1e'
down_revision = None
branch_labels = None
depends_on = None


def upgrade() -> None:
    op.create_table(
        'Items',
        sa.Column('id', sa.Integer, primary_key = True),
        sa.Column('name', sa.String, nullable=False),
        sa.Column('count', sa.Integer)
    )


def downgrade() -> None:
    op.drop_table('Items')
