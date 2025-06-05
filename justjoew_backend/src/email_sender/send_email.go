package emailsender

import (
	"fmt"
	"net/smtp"
	"os"
)

func SendEmail(subject string, message string, customerEmail string, name string) error {

	from := "forwarderjustjoew@gmail.com"
	emailPassword := os.Getenv("EMAIL_PASSWORD")
	msg := []byte("Subject: " + subject + "\r\n" + message + " \r\n user email " + customerEmail + " \r\n Name: " + name)

	to := "justjoew@outlook.com"

	auth := smtp.PlainAuth("", from, emailPassword, "smtp.gmail.com")

	err := smtp.SendMail("smtp.gmail.com:587",
		auth,
		from,
		[]string{to},
		msg)

	if err != nil {
		fmt.Println("Error: ", err)
		return err
	}

	fmt.Println("Email sent successfully")
	return nil
}
