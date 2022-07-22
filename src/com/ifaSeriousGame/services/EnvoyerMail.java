package com.ifaSeriousGame.services;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnvoyerMail {
	
	private String username = "mns.SeriousGame@gmail.com";
	private String password = "dH2Np3iqHvVBLGv";
	
	
	public void envoyer() {
	// Etape 1 : Création de la session
	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable","true");
	props.put("mail.smtp.host","smtp.gmail.com");
	props.put("mail.smtp.port","587");
	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	Session session = Session.getInstance(props,
	new javax.mail.Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication() {
	return new PasswordAuthentication(username, password);
	}
	});
	try {
	// Etape 2 : Création de l'objet Message
	Message message = new MimeMessage(session);
	message.setFrom(new InternetAddress("ran2web.ifa@gmail.com"));
	message.setRecipients(Message.RecipientType.TO,
	InternetAddress.parse("Olivertwist2000@hotmail.com"));
	message.setSubject("Test email");
	message.setText("Bonjour, ce message est un test ...");
	// Etape 3 : Envoyer le message
	Transport.send(message);
	System.out.println("Message_envoye");
	} catch (MessagingException e) {
	throw new RuntimeException(e);
	} }
	
	public void demandeReset(int idUtulisateur, int idScenario) {
		// Etape 1 : Création de la session
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.port","587");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		Session session = Session.getInstance(props,
		new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);
		}
		});
		try {
		// Etape 2 : Création de l'objet Message
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("ran2web.ifa@gmail.com"));
		message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse("ran2web.ifa@gmail.com"));
		message.setSubject("Reset Serious Game");
		message.setText("Bonjour, Le joueur : "+idUtulisateur+" souhaite reinitialiser le scenario : "+idScenario);
		
		// Etape 3 : Envoyer le message
		Transport.send(message);
		System.out.println("Message_envoye");
		} catch (MessagingException e) {
		throw new RuntimeException(e);
		} }
	
		public void envoiInvit(String login,String motDePasse) {
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.smtp.host","smtp.gmail.com");
			props.put("mail.smtp.port","587");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			Session session = Session.getInstance(props,
			new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
			}
			});
			try {
			// Etape 2 : Création de l'objet Message
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ran2web.ifa@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
			InternetAddress.parse(login));
			message.setSubject("Invitation Serious Game");
			message.setText("Bonjour, Ifa Serious Game vous invite. Pour vous connecter, merci de noter vos identifiants : Votre adresse mail : "+login+" Votre mot de passe : "+motDePasse+"."+"\n+Rendez-vous à l'adresse suivante : http://51.178.41.102:8888/Serious_Game/index");
			
			// Etape 3 : Envoyer le message
			Transport.send(message);
			System.out.println("Message_envoye");
			} catch (MessagingException e) {
			throw new RuntimeException(e);
			}
		}
}
