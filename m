Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A9807586
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 17:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649367.1013810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAv0c-0004Vu-Fv; Wed, 06 Dec 2023 16:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649367.1013810; Wed, 06 Dec 2023 16:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAv0c-0004TN-BV; Wed, 06 Dec 2023 16:44:26 +0000
Received: by outflank-mailman (input) for mailman id 649367;
 Wed, 06 Dec 2023 16:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx6I=HR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAv0b-0004TH-6i
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 16:44:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b59a5db6-9456-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 17:44:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EEFCC1FD2A;
 Wed,  6 Dec 2023 16:44:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB49C136CD;
 Wed,  6 Dec 2023 16:44:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vEhIMOWkcGXHaAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 06 Dec 2023 16:44:21 +0000
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
X-Inumbo-ID: b59a5db6-9456-11ee-9b0f-b553b5be7939
Message-ID: <b5b74155-e086-425d-8f5a-e9878d5d2da2@suse.com>
Date: Wed, 6 Dec 2023 17:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libs/evtchn: drop assert()s in stubdom
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231206144009.29154-1-jgross@suse.com>
 <CAKf6xpvu5txfU4uU26=Q-FyEmaaBazXPcOK_gU_=Tp=T98sS7g@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAKf6xpvu5txfU4uU26=Q-FyEmaaBazXPcOK_gU_=Tp=T98sS7g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JmnCiQtIVPdfGa60UKrYBReW"
X-Rspamd-Queue-Id: EEFCC1FD2A
X-Spam-Score: 15.00
X-Spam-Flag: YES
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd1
X-Spam-Level: ***************
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JmnCiQtIVPdfGa60UKrYBReW
Content-Type: multipart/mixed; boundary="------------v5ouR3jBBOuhda0eVaItMQkK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b5b74155-e086-425d-8f5a-e9878d5d2da2@suse.com>
Subject: Re: [PATCH] tools/libs/evtchn: drop assert()s in stubdom
References: <20231206144009.29154-1-jgross@suse.com>
 <CAKf6xpvu5txfU4uU26=Q-FyEmaaBazXPcOK_gU_=Tp=T98sS7g@mail.gmail.com>
In-Reply-To: <CAKf6xpvu5txfU4uU26=Q-FyEmaaBazXPcOK_gU_=Tp=T98sS7g@mail.gmail.com>

--------------v5ouR3jBBOuhda0eVaItMQkK
Content-Type: multipart/mixed; boundary="------------qY0Cz07POJLJk3xHopfaPGts"

--------------qY0Cz07POJLJk3xHopfaPGts
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTIuMjMgMTc6MzgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgRGVj
IDYsIDIwMjMgYXQgOTo0MOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gSW4gdG9vbHMvbGlicy9ldnRjaG4vbWluaW9zLmMgdGhlcmUgYXJl
IGFzc2VydCgpcyBmb3IgdGhlIGN1cnJlbnQNCj4+IHRocmVhZCBiZWluZyB0aGUgbWFpbiB0
aHJlYWQgd2hlbiBiaW5kaW5nIGFuIGV2ZW50IGNoYW5uZWwuDQo+Pg0KPj4gQXMgTWluaS1P
UyBpcyBzdXBwb3J0aW5nIG11bHRpcGxlIHRocmVhZHMsIHRoZXJlIGlzIG5vIHJlYWwgcmVh
c29uDQo+PiB3aHkgdGhlIGJpbmRpbmcgc2hvdWxkbid0IGJlIGFsbG93ZWQgdG8gaGFwcGVu
IGluIGFueSBvdGhlciB0aHJlYWQuDQo+Pg0KPj4gSnVzdCBkcm9wIHRoZSBhc3NlcnQoKXMu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPj4gLS0tDQo+PiAgIHRvb2xzL2xpYnMvZXZ0Y2huL21pbmlvcy5jIHwgMyAtLS0NCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnMvZXZ0Y2huL21pbmlvcy5jIGIvdG9vbHMvbGlicy9ldnRjaG4vbWluaW9z
LmMNCj4+IGluZGV4IDI4NzQzY2IwNTUuLmUzM2RkZWM3ZTcgMTAwNjQ0DQo+PiAtLS0gYS90
b29scy9saWJzL2V2dGNobi9taW5pb3MuYw0KPj4gKysrIGIvdG9vbHMvbGlicy9ldnRjaG4v
bWluaW9zLmMNCj4+IEBAIC0xOTUsNyArMTk1LDYgQEAgeGVuZXZ0Y2huX3BvcnRfb3JfZXJy
b3JfdCB4ZW5ldnRjaG5fYmluZF91bmJvdW5kX3BvcnQoeGVuZXZ0Y2huX2hhbmRsZSAqeGNl
LA0KPj4gICAgICAgaW50IHJldDsNCj4+ICAgICAgIGV2dGNobl9wb3J0X3QgcG9ydDsNCj4+
DQo+PiAtICAgIGFzc2VydChnZXRfY3VycmVudCgpID09IG1haW5fdGhyZWFkKTsNCj4+ICAg
ICAgIHBvcnRfaW5mbyA9IHBvcnRfYWxsb2MoeGNlKTsNCj4gDQo+IElmIG11bHRpcGxlIHRo
cmVhZHMgYXJlIGFsbG93ZWQsIGRvZXMgcG9ydF9saXN0IG5lZWQgdG8gZ2FpbiBhIGxvY2sN
Cj4gcHJvdGVjdGluZyBpdD8NCg0KSSB0aG91Z2h0IG9mIHRoYXQsIHRvby4NCg0KVGhlIGFu
c3dlciBpczogbWF5YmUNCg0KQW55IG90aGVyIGxpc3Qgb3BlcmF0aW9uIG9uIHRoZSBsaXN0
IGlzbid0IHByb3RlY3RlZCBieSBhbiBhc3NlcnQoKSwgc28NCnRlY2huaWNhbGx5IHRoZXJl
IGlzIG5vIHJlYWwgbmV3IGFzcGVjdCBhZGRlZCBpbiB0aGlzIHJlZ2FyZC4NCg0KSSBiZWxp
ZXZlIGFkZGluZyBhIGxvY2sgd291bGQgbWFrZSBzZW5zZSwgYnV0IGl0IGlzIG9ydGhvZ29u
YWwgdG8gdGhpcw0KcGF0Y2guDQoNCg0KSnVlcmdlbg0KDQo=
--------------qY0Cz07POJLJk3xHopfaPGts
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------qY0Cz07POJLJk3xHopfaPGts--

--------------v5ouR3jBBOuhda0eVaItMQkK--

--------------JmnCiQtIVPdfGa60UKrYBReW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVwpOUFAwAAAAAACgkQsN6d1ii/Ey/j
Rwf+Nyts+prQa8TWiboo5ThDhK6q1zU3ULzOHsrFPlnYp+6EmAuS+0YtpfHECzdaqd2w8Jsxl7EK
HzV+hcUWIzwqlFwQqHkQJqN3+qixOoYSoSiOaTJmb/MvTttDKVLrkEC7vzdIR2u5yg6pTxFK42qI
zoJgNOc7eNd5hPb7F4A9MHEaYGPvBcMdrkoZiShHDxdlWHij8WRrg35JndDvRcmqPbG0AtjzPOij
qbaQC4wLThHNuVkfXFE4tqvefQPAYultx18qoXFPExxlDLDj2Otb6EA5fKuOvWP96PxANFbQR2UO
qFVO0Qiv9kgnu8N2OGJDBz5Wy9iREdMT5x+bb1keag==
=Ku4Z
-----END PGP SIGNATURE-----

--------------JmnCiQtIVPdfGa60UKrYBReW--

