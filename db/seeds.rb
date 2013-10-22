Registrant.destroy_all
User.destroy_all

Registrant.create([
	{
		id: SecureRandom.urlsafe_base64,
		email: "bob@munat.com",
		expires_at: Time.now + 4.hours
	},
	{
		id: SecureRandom.urlsafe_base64,
		email: "bill@munat.com",
		expires_at: Time.now + 4.hours
	},
	{
		id: SecureRandom.urlsafe_base64,
		email: "biff@munat.com",
		expires_at: Time.now + 4.hours
	}
])

User.create([
	{
		id: SecureRandom.urlsafe_base64,
		name: "chas",
		email: "chas@munat.com",
		password: "123",
		password_confirmation: "123"
	},
	{
		id: SecureRandom.urlsafe_base64,
		name: "chad",
		email: "chad@munat.com",
		password: "123",
		password_confirmation: "123"
	},
	{
		id: SecureRandom.urlsafe_base64,
		name: "cas",
		email: "cas@munat.com",
		password: "123",
		password_confirmation: "123"
	}
])