def build_user
	User.create(
			email: 'users@users.users',
			password: 'test123456'
	)
end

def build_admin
	User.create(
			email: 'users@users.users',
			password: 'test123456',
			admin: 1
	)
end
