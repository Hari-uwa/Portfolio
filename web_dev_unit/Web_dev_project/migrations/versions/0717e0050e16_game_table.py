"""Game table

Revision ID: 0717e0050e16
Revises: b34c7e8ed962
Create Date: 2022-05-20 21:38:41.116406

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '0717e0050e16'
down_revision = 'b34c7e8ed962'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('game',
    sa.Column('game_id', sa.VARCHAR(length=45), nullable=False),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.Column('quiz_id', sa.Integer(), nullable=True),
    sa.Column('outcome', sa.BINARY(), nullable=True),
    sa.Column('duration', sa.Time(), nullable=True),
    sa.Column('date', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['quiz_id'], ['quiz.quiz_id'], ),
    sa.ForeignKeyConstraint(['user_id'], ['user.user_id'], ),
    sa.PrimaryKeyConstraint('game_id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('game')
    # ### end Alembic commands ###
