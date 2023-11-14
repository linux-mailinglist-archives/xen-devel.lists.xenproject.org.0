Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A57EACE9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632273.986510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pax-0006e9-SP; Tue, 14 Nov 2023 09:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632273.986510; Tue, 14 Nov 2023 09:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pax-0006al-PE; Tue, 14 Nov 2023 09:20:31 +0000
Received: by outflank-mailman (input) for mailman id 632273;
 Tue, 14 Nov 2023 09:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2paw-0006aZ-BK
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:20:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0da64af3-82cf-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 10:20:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8838218E2;
 Tue, 14 Nov 2023 09:20:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86DD213460;
 Tue, 14 Nov 2023 09:20:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vAstH9o7U2X/DAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 09:20:26 +0000
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
X-Inumbo-ID: 0da64af3-82cf-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699953626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iTaksS8tNnf6MJyxvxcFih0QWpZ+3szm0JHg0QsJ8mc=;
	b=Jf5wJHr/z4eKXcukn0E/f0R+haUiC/wvd9BqKqdV4Sm/0Tg6YjR/FXjB7Wp3M6bWzz3gLC
	lWKF/Lr2SMHIlboFMo/m42O0ZtEd8KcJy3Gb74J2Vi29WrF3TCBjDGV60pQrt1GqWUdjuk
	AUS/+UUyEvc14AEKImijFIy0Ob87twY=
Message-ID: <47cb32ab-d842-47aa-80fc-77cd61ee25bb@suse.com>
Date: Tue, 14 Nov 2023 10:20:25 +0100
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
In-Reply-To: <829d9031-058f-47ea-95bc-d41b4b439690@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zvS5W8SdCprTkVpjbBmqj7CG"
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
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zvS5W8SdCprTkVpjbBmqj7CG
Content-Type: multipart/mixed; boundary="------------0sKf8N0GlesIQGJmxgvt8Bah";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <47cb32ab-d842-47aa-80fc-77cd61ee25bb@suse.com>
Subject: Re: [PATCH v2 28/29] tools/xenstored: support complete log
 capabilities in stubdom
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-29-jgross@suse.com>
 <7e09a127-4977-486e-b028-48f4559cadb5@xen.org>
 <f9e8900b-10a9-4c88-bc99-118c61b549d7@suse.com>
 <829d9031-058f-47ea-95bc-d41b4b439690@xen.org>
In-Reply-To: <829d9031-058f-47ea-95bc-d41b4b439690@xen.org>

--------------0sKf8N0GlesIQGJmxgvt8Bah
Content-Type: multipart/mixed; boundary="------------W30FFWlnh7Rge3jRCcvRY2Xf"

--------------W30FFWlnh7Rge3jRCcvRY2Xf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjMgMTA6MDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxNC8xMS8yMDIzIDA2OjQ1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTMuMTEu
MjMgMjM6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMTAvMTEvMjAyMyAxNjowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gV2l0
aCA5cGZzIGJlaW5nIGZ1bGx5IGF2YWlsYWJsZSBpbiBYZW5zdG9yZS1zdHViZG9tIG5vdywg
dGhlcmUgaXMgbm8NCj4+Pj4gcmVhc29uIHRvIG5vdCBmdWxseSBzdXBwb3J0IGFsbCBsb2dn
aW5nIGNhcGFiaWxpdGllcyBpbiBzdHViZG9tLg0KPj4+Pg0KPj4+PiBPcGVuIHRoZSBsb2dm
aWxlIG9uIHN0dWJkb20gb25seSBhZnRlciB0aGUgOXBmcyBmaWxlIHN5c3RlbSBoYXMgYmVl
bg0KPj4+PiBtb3VudGVkLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVr
IDxqYW5kcnl1a0BnbWFpbC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoCB0b29scy9ob3RwbHVn
L0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbiB8wqAgMSArDQo+Pj4+IMKgIHRvb2xzL3hlbnN0
b3JlZC9jb250cm9sLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMwICsrKysrKysr
KysrKystLS0tLS0tLS0tLS0tDQo+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9taW5pb3MuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKysrDQo+Pj4+IMKgIDMgZmlsZXMg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+
IGRpZmYgLS1naXQgYS90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbiAN
Cj4+Pj4gYi90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbg0KPj4+PiBp
bmRleCBlODU0Y2ExZWI4Li5kYTRlZWNhN2M1IDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy9o
b3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbg0KPj4+PiArKysgYi90b29scy9ob3Rw
bHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbg0KPj4+PiBAQCAtOTgsNiArOTgsNyBAQCB0
ZXN0IC1mIEBDT05GSUdfRElSQC9AQ09ORklHX0xFQUZfRElSQC94ZW5jb21tb25zICYmIC4g
DQo+Pj4+IEBDT05GSUdfRElSQC9AQ09ORklHX0xFQUYNCj4+Pj4gwqDCoMKgwqDCoCBbIC16
ICIkWEVOU1RPUkVfRE9NQUlOX1NJWkUiIF0gJiYgWEVOU1RPUkVfRE9NQUlOX1NJWkU9OA0K
Pj4+PiDCoMKgwqDCoMKgIFhFTlNUT1JFX0RPTUFJTl9BUkdTPSIkWEVOU1RPUkVfRE9NQUlO
X0FSR1MgLS1tZW1vcnkgDQo+Pj4+ICRYRU5TVE9SRV9ET01BSU5fU0laRSINCj4+Pj4gwqDC
oMKgwqDCoCBbIC16ICIkWEVOU1RPUkVfTUFYX0RPTUFJTl9TSVpFIiBdIHx8IA0KPj4+PiBY
RU5TVE9SRV9ET01BSU5fQVJHUz0iJFhFTlNUT1JFX0RPTUFJTl9BUkdTIC0tbWF4bWVtICRY
RU5TVE9SRV9NQVhfRE9NQUlOX1NJWkUiDQo+Pj4+ICvCoMKgwqAgWyAteiAiJFhFTlNUT1JF
RF9UUkFDRSIgXSB8fCANCj4+Pj4gWEVOU1RPUkVfRE9NQUlOX0FSR1M9IiRYRU5TVE9SRV9E
T01BSU5fQVJHUyAtVCB4ZW5zdG9yZWQtdHJhY2UubG9nIg0KPj4+DQo+Pj4gSSBhbSBwcm9i
YWJseSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IGFueSByZWFzb24gdG8gbm90IHVzZSANCj4+
PiBAWEVOX0xPR19ESVJAL3hlbnN0b3JlZC10cmFjZS5sb2cgYXMgd2UgZG8gZm9yIHhlbnN0
b3JlZD8NCj4+DQo+PiBZZXMuIFN0dWJkb20gaGFzIG5vIGFjY2VzcyB0byBYRU5fTE9HX0RJ
Ui4NCj4gDQo+IE9rLiBUaGlzIHJlc3RyaWN0aW9uIGlzIG5vdCB0aGF0IG9idmlvdXMuLi4g
VGhlIGRvY3VtZW50YXRpb24gaW4gDQo+IHN5c2NvbmZpZy54ZW5jb21tb25zLmluIGltcGxp
ZXMgdGhhdCBpdCB3aWxsIGJlIHdyaXR0ZW4gaW4gWEVOX0xPR19ESVI6DQo+IA0KPiAjIyBU
eXBlOiBzdHJpbmcNCj4gIyMgRGVmYXVsdDogIiINCj4gIw0KPiAjIEFkZGl0aW9uYWwgY29t
bWFuZGxpbmUgYXJndW1lbnRzIHRvIHN0YXJ0IHhlbnN0b3JlZCwNCj4gIyBsaWtlICItLXRy
YWNlLWZpbGUgQFhFTl9MT0dfRElSQC94ZW5zdG9yZWQtdHJhY2UubG9nIg0KPiAjIFNlZSAi
QHNiaW5kaXJAL3hlbnN0b3JlZCAtLWhlbHAiIGZvciBwb3NzaWJsZSBvcHRpb25zLg0KPiAj
IE9ubHkgZXZhbHVhdGVkIGlmIFhFTlNUT1JFVFlQRSBpcyAiZGFlbW9uIi4NCj4gWEVOU1RP
UkVEX0FSR1M9DQo+IA0KPiBBbHNvLCB3ZSBhcmUgc2F5aW5nIHRoaXMgaXMgb25seSBzdXBw
b3J0ZWQgd2hlbiBYZW5zdG9yZWQgaXMgZGFlbW9uaXplZC4gU28gSSANCj4gdGhpbmsgdGhl
cmUgYXJlIHNvbWUgZG9jdW1lbnRhdGlvbiB1cGRhdGUgbmVjZXNzYXJ5IGluIHRoaXMgcGF0
Y2guDQoNClRoaXMgaXMgZm9yIHRoZSBkYWVtb24uIEFuZCB0aGUgZG9jdW1lbnRhdGlvbiBl
eGFtcGxlIGhlcmUgaXMgdXNpbmcgYW4NCmFic29sdXRlIGZpbGVuYW1lLCBzbyB0aGlzIGlz
IHZlcnkgY2xlYXIgd2hlcmUgdGhlIHRyYWNlIGZpbGUgd2lsbCBiZSB3cml0dGVuLg0KDQpG
b3Igc3R1YmRvbSBhIHJlbGF0ZWQgcGFyYW1ldGVyICJYRU5TVE9SRV9ET01BSU5fQVJHUyIg
aXMgYXZhaWxhYmxlLiBJIGNhbiBhZGQNCmEgc2VudGVuY2UgdG8gdGhlIGV4cGxhbmF0aW9u
IG9mIHRoYXQgcGFyYW1ldGVyIGRlc2NyaWJpbmcgc2V0dGluZyBvZiBhDQpwb3NzaWJsZSB0
cmFjZSBmaWxlIHNwZWNpZmljYXRpb24uDQoNCg0KSnVlcmdlbg0KDQo=
--------------W30FFWlnh7Rge3jRCcvRY2Xf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------W30FFWlnh7Rge3jRCcvRY2Xf--

--------------0sKf8N0GlesIQGJmxgvt8Bah--

--------------zvS5W8SdCprTkVpjbBmqj7CG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTO9oFAwAAAAAACgkQsN6d1ii/Ey9j
8Af/dMJ+z4MpHRRjLq0K19hsvNnKCGufqyAbMPwapPqj+s7tbr5xabiDs1WVItV81KWugvnB6gef
mrm2pNOhQZY9KzLJEgweuZwu9MNj/d9ndiHrVO8FH0kjdIEHf1IEv76qeNgnQSIzfjVAo8eOdIAm
rlAdhwY8zcOeVWAbnSnZ+Psxo/y07LCvdbiiZ/7vI/s451dR8mgkwwqCheH8wxErjSoNXQkORzsC
cNtyuOvwmYF9A5emmEEAyn94rR/QyIGV66xMv9pZogN80alSVRxwyNg7BjPqJ1UENt5xrkCHz5Wv
oWEAW1RXFdruENX7F1/jEDTII8LM2BqZeNQOv//Dew==
=ea/x
-----END PGP SIGNATURE-----

--------------zvS5W8SdCprTkVpjbBmqj7CG--

