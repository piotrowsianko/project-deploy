"""init

Revision ID: a5d5f0b5fa30
Revises: 80f1c6535f1e
Create Date: 2022-07-25 15:17:25.845924

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'a5d5f0b5fa30'
down_revision = '80f1c6535f1e'
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
