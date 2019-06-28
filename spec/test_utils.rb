def build_user
	User.create(
			email: 'user@user.user',
			password: 'test123456'
	)
end

def build_admin
	User.create(
			email: 'user@user.user',
			password: 'test123456',
			admin: 1
	)
end
