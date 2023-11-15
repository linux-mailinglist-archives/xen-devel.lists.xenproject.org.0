Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4B7EBCF6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 07:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633494.988315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r39DE-0005ts-FC; Wed, 15 Nov 2023 06:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633494.988315; Wed, 15 Nov 2023 06:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r39DE-0005rW-CH; Wed, 15 Nov 2023 06:17:20 +0000
Received: by outflank-mailman (input) for mailman id 633494;
 Wed, 15 Nov 2023 06:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzjc=G4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r39DD-0005rO-3w
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 06:17:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0b76bdc-837e-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 07:17:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B98B228EA;
 Wed, 15 Nov 2023 06:17:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60CE613587;
 Wed, 15 Nov 2023 06:17:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pcRHFm1iVGV0UgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Nov 2023 06:17:17 +0000
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
X-Inumbo-ID: a0b76bdc-837e-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700029037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xZ8sPgq6nSRIc2X9KLi8RcfQJrLk4EVTp3O+91HMedA=;
	b=ecVqMnkwujCJVI5aBQHt2O8UPNbgfpcLlPeOaJddlD2+g0e04piNlsGcOCVFOpm93N/jrJ
	ZtJEcTS18Q/IC+Kg/qEErdFO5iXFUmhfxCe1SFYpSU3AfSXKF219KVlfPcJV4kc7MxDZwB
	lHWmftYCXDNsJextKYQcRGwl7NOwPEE=
Message-ID: <df9a3390-3e71-4008-adba-a2e2d3f0d65f@suse.com>
Date: Wed, 15 Nov 2023 07:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/29] tools/xenstored: support complete log
 capabilities in stubdom
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-29-jgross@suse.com>
 <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
 <f9e8900b-10a9-4c88-bc99-118c61b549d7@suse.com>
 <829d9031-058f-47ea-95bc-d41b4b439690@xen.org>
 <47cb32ab-d842-47aa-80fc-77cd61ee25bb@suse.com>
 <1cedf7ab-aa82-484c-9ddb-2b2537cc1d4a@xen.org>
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
In-Reply-To: <1cedf7ab-aa82-484c-9ddb-2b2537cc1d4a@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LdRqkpHDN61vKevJgFQYUqzM"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 BAYES_HAM(-3.00)[100.00%];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LdRqkpHDN61vKevJgFQYUqzM
Content-Type: multipart/mixed; boundary="------------7xzxUv0lftK9I0ccPovSTKxx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <df9a3390-3e71-4008-adba-a2e2d3f0d65f@suse.com>
Subject: Re: [PATCH v2 28/29] tools/xenstored: support complete log
 capabilities in stubdom
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-29-jgross@suse.com>
 <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
 <f9e8900b-10a9-4c88-bc99-118c61b549d7@suse.com>
 <829d9031-058f-47ea-95bc-d41b4b439690@xen.org>
 <47cb32ab-d842-47aa-80fc-77cd61ee25bb@suse.com>
 <1cedf7ab-aa82-484c-9ddb-2b2537cc1d4a@xen.org>
In-Reply-To: <1cedf7ab-aa82-484c-9ddb-2b2537cc1d4a@xen.org>

--------------7xzxUv0lftK9I0ccPovSTKxx
Content-Type: multipart/mixed; boundary="------------vsy80kgYmPdBAE8bJYzwOfFy"

--------------vsy80kgYmPdBAE8bJYzwOfFy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjMgMjE6NTcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDE0LzExLzIwMjMgMDk6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxNC4xMS4yMyAxMDowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gT24gMTQvMTEvMjAyMyAwNjo0NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24g
MTMuMTEuMjMgMjM6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpIEp1ZXJnZW4s
DQo+Pj4+Pg0KPj4+Pj4gT24gMTAvMTEvMjAyMyAxNjowOCwgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4+Pj4+PiBXaXRoIDlwZnMgYmVpbmcgZnVsbHkgYXZhaWxhYmxlIGluIFhlbnN0b3Jl
LXN0dWJkb20gbm93LCB0aGVyZSBpcyBubw0KPj4+Pj4+IHJlYXNvbiB0byBub3QgZnVsbHkg
c3VwcG9ydCBhbGwgbG9nZ2luZyBjYXBhYmlsaXRpZXMgaW4gc3R1YmRvbS4NCj4+Pj4+Pg0K
Pj4+Pj4+IE9wZW4gdGhlIGxvZ2ZpbGUgb24gc3R1YmRvbSBvbmx5IGFmdGVyIHRoZSA5cGZz
IGZpbGUgc3lzdGVtIGhhcyBiZWVuDQo+Pj4+Pj4gbW91bnRlZC4NCj4+Pj4+Pg0KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4+
PiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPg0KPj4+
Pj4+IC0tLQ0KPj4+Pj4+IMKgIHRvb2xzL2hvdHBsdWcvTGludXgvbGF1bmNoLXhlbnN0b3Jl
LmluIHzCoCAxICsNCj4+Pj4+PiDCoCB0b29scy94ZW5zdG9yZWQvY29udHJvbC5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzMCArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0K
Pj4+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9taW5pb3MuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDMgKysrDQo+Pj4+Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQg
YS90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbiANCj4+Pj4+PiBiL3Rv
b2xzL2hvdHBsdWcvTGludXgvbGF1bmNoLXhlbnN0b3JlLmluDQo+Pj4+Pj4gaW5kZXggZTg1
NGNhMWViOC4uZGE0ZWVjYTdjNSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS90b29scy9ob3RwbHVn
L0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbg0KPj4+Pj4+ICsrKyBiL3Rvb2xzL2hvdHBsdWcv
TGludXgvbGF1bmNoLXhlbnN0b3JlLmluDQo+Pj4+Pj4gQEAgLTk4LDYgKzk4LDcgQEAgdGVz
dCAtZiBAQ09ORklHX0RJUkAvQENPTkZJR19MRUFGX0RJUkAveGVuY29tbW9ucyAmJiAuIA0K
Pj4+Pj4+IEBDT05GSUdfRElSQC9AQ09ORklHX0xFQUYNCj4+Pj4+PiDCoMKgwqDCoMKgIFsg
LXogIiRYRU5TVE9SRV9ET01BSU5fU0laRSIgXSAmJiBYRU5TVE9SRV9ET01BSU5fU0laRT04
DQo+Pj4+Pj4gwqDCoMKgwqDCoCBYRU5TVE9SRV9ET01BSU5fQVJHUz0iJFhFTlNUT1JFX0RP
TUFJTl9BUkdTIC0tbWVtb3J5IA0KPj4+Pj4+ICRYRU5TVE9SRV9ET01BSU5fU0laRSINCj4+
Pj4+PiDCoMKgwqDCoMKgIFsgLXogIiRYRU5TVE9SRV9NQVhfRE9NQUlOX1NJWkUiIF0gfHwg
DQo+Pj4+Pj4gWEVOU1RPUkVfRE9NQUlOX0FSR1M9IiRYRU5TVE9SRV9ET01BSU5fQVJHUyAt
LW1heG1lbSANCj4+Pj4+PiAkWEVOU1RPUkVfTUFYX0RPTUFJTl9TSVpFIg0KPj4+Pj4+ICvC
oMKgwqAgWyAteiAiJFhFTlNUT1JFRF9UUkFDRSIgXSB8fCANCj4+Pj4+PiBYRU5TVE9SRV9E
T01BSU5fQVJHUz0iJFhFTlNUT1JFX0RPTUFJTl9BUkdTIC1UIHhlbnN0b3JlZC10cmFjZS5s
b2ciDQo+Pj4+Pg0KPj4+Pj4gSSBhbSBwcm9iYWJseSBtaXNzaW5nIHNvbWV0aGluZywgYnV0
IGFueSByZWFzb24gdG8gbm90IHVzZSANCj4+Pj4+IEBYRU5fTE9HX0RJUkAveGVuc3RvcmVk
LXRyYWNlLmxvZyBhcyB3ZSBkbyBmb3IgeGVuc3RvcmVkPw0KPj4+Pg0KPj4+PiBZZXMuIFN0
dWJkb20gaGFzIG5vIGFjY2VzcyB0byBYRU5fTE9HX0RJUi4NCj4+Pg0KPj4+IE9rLiBUaGlz
IHJlc3RyaWN0aW9uIGlzIG5vdCB0aGF0IG9idmlvdXMuLi4gVGhlIGRvY3VtZW50YXRpb24g
aW4gDQo+Pj4gc3lzY29uZmlnLnhlbmNvbW1vbnMuaW4gaW1wbGllcyB0aGF0IGl0IHdpbGwg
YmUgd3JpdHRlbiBpbiBYRU5fTE9HX0RJUjoNCj4+Pg0KPj4+ICMjIFR5cGU6IHN0cmluZw0K
Pj4+ICMjIERlZmF1bHQ6ICIiDQo+Pj4gIw0KPj4+ICMgQWRkaXRpb25hbCBjb21tYW5kbGlu
ZSBhcmd1bWVudHMgdG8gc3RhcnQgeGVuc3RvcmVkLA0KPj4+ICMgbGlrZSAiLS10cmFjZS1m
aWxlIEBYRU5fTE9HX0RJUkAveGVuc3RvcmVkLXRyYWNlLmxvZyINCj4+PiAjIFNlZSAiQHNi
aW5kaXJAL3hlbnN0b3JlZCAtLWhlbHAiIGZvciBwb3NzaWJsZSBvcHRpb25zLg0KPj4+ICMg
T25seSBldmFsdWF0ZWQgaWYgWEVOU1RPUkVUWVBFIGlzICJkYWVtb24iLg0KPj4+IFhFTlNU
T1JFRF9BUkdTPQ0KPj4+DQo+Pj4gQWxzbywgd2UgYXJlIHNheWluZyB0aGlzIGlzIG9ubHkg
c3VwcG9ydGVkIHdoZW4gWGVuc3RvcmVkIGlzIGRhZW1vbml6ZWQuIFNvIEkgDQo+Pj4gdGhp
bmsgdGhlcmUgYXJlIHNvbWUgZG9jdW1lbnRhdGlvbiB1cGRhdGUgbmVjZXNzYXJ5IGluIHRo
aXMgcGF0Y2guDQo+Pg0KPj4gVGhpcyBpcyBmb3IgdGhlIGRhZW1vbi4gQW5kIHRoZSBkb2N1
bWVudGF0aW9uIGV4YW1wbGUgaGVyZSBpcyB1c2luZyBhbg0KPj4gYWJzb2x1dGUgZmlsZW5h
bWUsIHNvIHRoaXMgaXMgdmVyeSBjbGVhciB3aGVyZSB0aGUgdHJhY2UgZmlsZSB3aWxsIGJl
IHdyaXR0ZW4uDQo+IA0KPiBBaCB5ZXMuIFNvcnJ5IEkgZ290IGNvbmZ1c2VkLg0KPiANCj4+
DQo+PiBGb3Igc3R1YmRvbSBhIHJlbGF0ZWQgcGFyYW1ldGVyICJYRU5TVE9SRV9ET01BSU5f
QVJHUyIgaXMgYXZhaWxhYmxlLiBJIGNhbiBhZGQNCj4+IGEgc2VudGVuY2UgdG8gdGhlIGV4
cGxhbmF0aW9uIG9mIHRoYXQgcGFyYW1ldGVyIGRlc2NyaWJpbmcgc2V0dGluZyBvZiBhDQo+
PiBwb3NzaWJsZSB0cmFjZSBmaWxlIHNwZWNpZmljYXRpb24uDQo+IA0KPiBEbyB5b3UgbWVh
biBpbiB0aGUgZm9sbG93aW5nIGNvbW1lbnQ6DQo+IA0KPiAjIyBUeXBlOiBzdHJpbmcNCj4g
IyMgRGVmYXVsdDogTm90IGRlZmluZWQsIHRyYWNpbmcgb2ZmDQo+ICMNCj4gIyBMb2cgeGVu
c3RvcmVkIG1lc3NhZ2VzDQo+ICMgT25seSBldmFsdWF0ZWQgaWYgWEVOU1RPUkVUWVBFIGlz
ICJkYWVtb24iLg0KPiAjWEVOU1RPUkVEX1RSQUNFPVt5ZXN8b258MV0NCj4gDQo+IEkgdGhp
bmsgaGVyZSB3ZSBuZWVkIHRvIHJlbW92ZSB0aGUgIk9ubHkuLi4iLg0KDQpPaCwgSSBtaXNz
ZWQgdGhhdCBvbmUuIEl0IG5lZWRzIHRvIGJlIGNvbnNpZGVyZWQgaW4gdGhlIHN0dWJkb20g
Y2FzZSwgdG9vLg0KDQoNCkp1ZXJnZW4NCg==
--------------vsy80kgYmPdBAE8bJYzwOfFy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vsy80kgYmPdBAE8bJYzwOfFy--

--------------7xzxUv0lftK9I0ccPovSTKxx--

--------------LdRqkpHDN61vKevJgFQYUqzM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVUYmwFAwAAAAAACgkQsN6d1ii/Ey+K
0Qf+Nb9I84fgfh/OiYYGk+3sUKTI8bjk0pL8pA6AsnX/loNsRkMnBjH/Y9qKUNGXYDdaBFVilfMy
6j1w6vUsReip5JdWhCa0wk5De0STUQ0G+6wE93U6hgf5Skge2TEdUdyWnoYiahxezFywofjnSea9
hUYd+vDHnGGzlGvqqQLZA/nGOvFMgkQvOfiqr6/9ZEVqmA7c7wEErTuTOXUZ/7Di6fxImABGWBOn
xuPpKqaZBAL5SUBLcU/mHjgvP38Y85gxqBc66Cg75RGDJ3HaagWAwW7QnO5FY4eLPZiqkhZmnWU/
J6JrL5XaLVVbP97mklkw0kMaAstqYQWCAQxr686PGg==
=5pj1
-----END PGP SIGNATURE-----

--------------LdRqkpHDN61vKevJgFQYUqzM--

