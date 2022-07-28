"""add win column for User

Revision ID: 734027047b31
Revises: bd70a5ed9b1e
Create Date: 2022-05-30 03:27:44.228899

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '734027047b31'
down_revision = 'bd70a5ed9b1e'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.add_column(sa.Column('win', sa.Integer(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.drop_column('win')

    # ### end Alembic commands ###
