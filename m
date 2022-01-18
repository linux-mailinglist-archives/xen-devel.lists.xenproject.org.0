Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6F492463
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 12:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258449.445105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mQm-0005RV-5y; Tue, 18 Jan 2022 11:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258449.445105; Tue, 18 Jan 2022 11:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mQm-0005Pf-2r; Tue, 18 Jan 2022 11:13:40 +0000
Received: by outflank-mailman (input) for mailman id 258449;
 Tue, 18 Jan 2022 11:13:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tdM9=SC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n9mQl-0005PZ-3U
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 11:13:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af2945a2-784f-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 12:13:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 87AA91F3C5;
 Tue, 18 Jan 2022 11:13:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 678C813DC7;
 Tue, 18 Jan 2022 11:13:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 01qvF+Gg5mGGRQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 18 Jan 2022 11:13:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: af2945a2-784f-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642504417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uoxFEPOrySa2QnKccs7jNF4BSjpQcFJTGngSa8iYQVM=;
	b=h/p+ZsNhdzme++URWLalnnjz+ro4XrTTGIKN+LQdnZjgSpQS8bBtow0sMn+wVeIuvCaggC
	W5wrkI3QtTUITTP7DnfMxNpGYDsyDQDz9Bm/4qzytrHHkXSy1Q7uOX5E7EDclX113t1KUo
	+M0DOY772BRFf5dj36kyfSw16NSWk9E=
Message-ID: <39794058-78ce-994c-c854-cea206ff938e@suse.com>
Date: Tue, 18 Jan 2022 12:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <d3ba970c-3930-fb4e-4fd2-4246700fd11e@eikelenboom.it>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Regression booting Linux kernel 5.16.1 under Xen: Failed to
 update kernel mapping for mfn=6930582 pfn=524288
In-Reply-To: <d3ba970c-3930-fb4e-4fd2-4246700fd11e@eikelenboom.it>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jvfAnIsMy3dwSTsYSsr0sjtQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jvfAnIsMy3dwSTsYSsr0sjtQ
Content-Type: multipart/mixed; boundary="------------jCVkok2zMNd9da8Jz3TC0aPu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Sander Eikelenboom <linux@eikelenboom.it>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <39794058-78ce-994c-c854-cea206ff938e@suse.com>
Subject: Re: Regression booting Linux kernel 5.16.1 under Xen: Failed to
 update kernel mapping for mfn=6930582 pfn=524288
References: <d3ba970c-3930-fb4e-4fd2-4246700fd11e@eikelenboom.it>
In-Reply-To: <d3ba970c-3930-fb4e-4fd2-4246700fd11e@eikelenboom.it>

--------------jCVkok2zMNd9da8Jz3TC0aPu
Content-Type: multipart/mixed; boundary="------------ELYkvZFuPF9RyRclbXgQMN0H"

--------------ELYkvZFuPF9RyRclbXgQMN0H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDEuMjIgMTE6NTMsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToNCj4gTC5TLiwN
Cj4gDQo+IEJvdGggTGludXgga2VybmVsIDUuMTYuMCBhbmQgNS4xNi4xIGZhaWwgdG8gYm9v
dCBhcyBEb20wIHVuZGVyIA0KPiB4ZW4tdW5zdGFibGUgYW5kIGNyYXNoIGVhcmx5IGluIGJv
b3Qgb24gbXkgaGFyZHdhcmUuDQo+IFdpdGggTGludXggNS4xNS4xMyBpdCBib290cyBmaW5l
LiBTZXJpYWwgbG9nIGlzIGJlbG93Lg0KDQouLi4NCg0KPiAoWEVOKSBbMDAwMDAwMWIxZmZl
ZGViOF0gQ29tbWFuZCBsaW5lOiBkb20wX21lbT0yMDQ4TSxtYXg6MjA0OE0gDQo+IGxvZ2x2
bD1hbGwgZ3Vlc3RfbG9nbHZsPWFsbCBjb25zb2xlX3RpbWVzdGFtcHM9ZGF0ZW1zIA0KPiB2
Z2E9Z2Z4LTEyODB4MTAyNHgzMiBuby1jcHVpZGxlIGNvbTE9Mzg0MDAsOG4xIGNvbnNvbGU9
dmdhLGNvbTEgDQo+IGl2cnNfaW9hcGljWzZdPTAwOjE0LjAgaW9tbXU9b24sdmVyYm9zZSxk
ZWJ1ZyBjb25yaW5nX3NpemU9MTI4ayANCj4gdWNvZGU9c2NhbiBzY2hlZD1jcmVkaXQyIGdu
dHRhYl9tYXhfZnJhbWVzPTY0IHJlYm9vdD1hDQoNCi4uLg0KDQo+IG1hcHBpbmcga2VybmVs
IGludG8gcGh5c2ljYWwgbWVtb3J5DQo+IGFib3V0IHRvIGdldCBzdGFydGVkLi4uDQo+IFvC
oMKgwqAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS4xNi4xLTIwMjIwMTE4LWRvZmxyLW1h
YzgwMjExZGVidWcrIA0KPiAocm9vdEBzZXJ2ZWVyc3RlcnRqZSkgKGdjYyAoRGViaWFuIDgu
My4wLTYpIDguMy4wLCBHTlUgbGQgKEdOVSBCaW51dGlscyANCj4gZm9yIERlYmlhbikgMi4z
MS4xKSAjMSBTTVAgUFJFRU1QVCBUdWUgSmFuIDE4IDEwOjQ5OjA5IENFVCAyMDIyDQo+IFvC
oMKgwqAgMC4wMDAwMDBdIENvbW1hbmQgbGluZTogcm9vdD0vZGV2L21hcHBlci9zZXJ2ZWVy
c3RlcnRqZV9zc2Qtcm9vdCBybyANCj4gdmVyYm9zZSBlYXJseXByaW50az14ZW4gbWVtPTIw
NDhNIGNvbnNvbGU9aHZjMCBzY3NpX21vZC51c2VfYmxrX21xPTEgDQo+IGNvbnNvbGU9dHR5
MCBhY3BpX2VuZm9yY2VfcmVzb3VyY2VzPWxheCBtYXhfbG9vcD0zMCBsb29wX21heF9wYXJ0
PTEwIA0KPiByODE2OS51c2VfZGFjPTEgbG9nbGV2ZWw9MTAgbm9tb2Rlc2V0IG5ldC5pZm5h
bWVzPTAgYmlvc2Rldm5hbWU9MCANCj4geGVuLXBjaWJhY2suaGlkZT0oMDA6MTQuMikoMDQ6
MDAuKikoMDg6MDAuMCkoMDk6MDAuKikoMGE6MDAuMCkoMGQ6MDAuMCkNCg0KLi4uDQoNCj4g
W8KgwqDCoCAwLjEzNTY3MF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
DQo+IFvCoMKgwqAgMC4xMzU2OTBdIEZhaWxlZCB0byB1cGRhdGUga2VybmVsIG1hcHBpbmcg
Zm9yIG1mbj02OTMwNTgyIHBmbj01MjQyODgNCj4gW8KgwqDCoCAwLjEzNTcwMV0gV0FSTklO
RzogQ1BVOiAwIFBJRDogMCBhdCBhcmNoL3g4Ni94ZW4vc2V0dXAuYzozMTIgDQo+IHhlbl9y
ZW1hcF9tZW1vcnkrMHgxOTEvMHgyNmMNCg0KVGhlcmUgc2VlbXMgdG8gYmUgYSBwcm9ibGVt
IHdpdGggcmVhcnJhbmdpbmcgdGhlIGRvbTAgbWVtb3J5IGxheW91dA0KdG8gbWF0Y2ggdGhh
dCBvZiB0aGUgaG9zdC4gRXNwZWNpYWxseSBpdCBpcyBnb2luZyBzaWRld2F5cyB3aGVuIHRy
eWluZw0KdG8gcmVtYXAgYSBtZW1vcnkgZnJhbWUgdG8gUEZOIDUyNDI4OCAoMHg4MDAwMCku
DQoNCllvdSBhcmUgbGltaXRpbmcgZG9tMCBtZW1vcnkgdG8gMiBHQiB2aWEgWGVuIGNvbW1h
bmQgbGluZSwgYnV0IGluDQphZGRpdGlvbiB0byB0aGF0IHlvdSBzcGVjaWZ5ICJtZW09MjA0
OE0iIGZvciB0aGUgZG9tMCBrZXJuZWwsIHRvby4gVGhpcw0Kc2hvdWxkIGNhcCBtZW1vcnkg
ZnJvbSBQRk4gMHg4MDAwMCBvbndhcmRzLCBoZW5jZSB0aGUgZmFpbHVyZSB3aGVuIGRvbTAN
CnRyaWVzIHRvIHJlbWFwIGEgZnJhbWUgaW50byB0aGlzIGFyZWEuDQoNCkNhbiB5b3UgcGxl
YXNlIHRyeSByZW1vdmluZyB0aGUgIm1lbT0yMDQ4TSIgZnJvbSB0aGUgZG9tMCBwYXJhbWV0
ZXJzPw0KDQpJIHRoaW5rIHRoZXJlIGhhcyBiZWVuIGEga2VybmVsIGNvbW1pdCBmaXhpbmcg
dGhlIGNvcnJlY3QgaGFuZGxpbmcgb2YNCnRoZSAibWVtPSIgcGFyYW1ldGVyIGluIDUuMTYs
IHdoaWNoIG1pZ2h0IGJlIHRoZSByZWFzb24gd2h5IHlvdSBhcmUNCnNlZWluZyB0aGUgY3Jh
c2ggb25seSBub3cuDQoNCg0KSnVlcmdlbg0K
--------------ELYkvZFuPF9RyRclbXgQMN0H
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ELYkvZFuPF9RyRclbXgQMN0H--

--------------jCVkok2zMNd9da8Jz3TC0aPu--

--------------jvfAnIsMy3dwSTsYSsr0sjtQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHmoOAFAwAAAAAACgkQsN6d1ii/Ey+W
UAgAmh50jJaibsSkjwO/nlmDP61xYgJdKbm/VE+4FOikjgHAo1NGX2btsgY0yaKcjhJcfEjzvFIj
WeMaCHOco7v/fOupz2OzEdc/eFfSqe5CQIae58UBxXWTDNFOQwAM1DkojbmAjV7pa0rqdnmSZC/h
H0l9B1m5VszLjHNT0dC+FnmuAruWh54s2P35sV0JChby1ENvnF8AxfDXR8wzFHxqtDyvJBuMUIs4
NkSw13kTBW+2uANDo2cS9prYsa2/fKZJeygFBjZBz83ZEjcsW8GTYoAWSoH/T1VJu4YVDjae6zIZ
+NdJ7uEFtR/s77C0+I+IGfwGxKf72sgb5nUVxhQBKQ==
=DT5b
-----END PGP SIGNATURE-----

--------------jvfAnIsMy3dwSTsYSsr0sjtQ--

