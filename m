Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3304D7ED1
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 10:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290080.491955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThB9-0004iZ-UM; Mon, 14 Mar 2022 09:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290080.491955; Mon, 14 Mar 2022 09:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nThB9-0004fH-RK; Mon, 14 Mar 2022 09:39:51 +0000
Received: by outflank-mailman (input) for mailman id 290080;
 Mon, 14 Mar 2022 09:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JTg9=TZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nThB8-0004f9-D4
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 09:39:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0f90aa5-a37a-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 10:39:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D904C210FE
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 09:39:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C49CA13B2B
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 09:39:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rC0uLmQNL2KVcAAAMHmgww
 (envelope-from <jgross@suse.com>)
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 09:39:48 +0000
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
X-Inumbo-ID: b0f90aa5-a37a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647250788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4oMwhLtNSY0dANrfEaGPHs6ABlfisenzF1qytq77EQE=;
	b=QwqvD2mIFD/GArQZyvMD/dzS5psiQDlaugNxFq9V5k9wQurqa9q33ZOhmyy/5/PvNVY5wc
	EW3Rtxx/FxWyXhAbjYafiAyb7gB2bPtykC17hjv9QEy06RzRsetcpWtn/M3Ouh1ZZ2ldO7
	D56caxe4+yzAHtp7ueca+Th9jSv5ooU=
Message-ID: <2851e287-8b37-822e-f363-492e46af28cc@suse.com>
Date: Mon, 14 Mar 2022 10:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20220228112224.18942-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220228112224.18942-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------08C7iluchGlib5pdNTxrpvBU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------08C7iluchGlib5pdNTxrpvBU
Content-Type: multipart/mixed; boundary="------------4EwdI0uyC0uPEVXFvmGbvxuy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Message-ID: <2851e287-8b37-822e-f363-492e46af28cc@suse.com>
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
References: <20220228112224.18942-1-jgross@suse.com>
In-Reply-To: <20220228112224.18942-1-jgross@suse.com>

--------------4EwdI0uyC0uPEVXFvmGbvxuy
Content-Type: multipart/mixed; boundary="------------pJSWg1pk9MmnUioD0iwpGi0x"

--------------pJSWg1pk9MmnUioD0iwpGi0x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMjguMDIuMjIgMTI6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFRo
ZSByZXN1bHQgZmllbGQgb2Ygc3RydWN0IHZzY3NpaWZfcmVzcG9uc2UgaXMgbGFja2luZyBh
IGRldGFpbGVkDQo+IGRlZmluaXRpb24uIFRvZGF5IHRoZSBMaW51eCBrZXJuZWwgaW50ZXJu
YWwgc2NzaSBkZWZpbml0aW9ucyBhcmUgYmVpbmcNCj4gdXNlZCwgd2hpY2ggaXMgbm90IGEg
c2FuZSBpbnRlcmZhY2UgZm9yIGEgUFYgZGV2aWNlIGRyaXZlci4NCj4gDQo+IEFkZCBtYWNy
b3MgdG8gY2hhbmdlIHRoYXQgYnkgdXNpbmcgdG9kYXkncyB2YWx1ZXMgaW4gdGhlIFhFTiBu
YW1lc3BhY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQo+IC0tLQ0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9pby92c2NzaWlmLmgg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9pby92c2NzaWlmLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vdnNjc2lpZi5oDQo+IGlu
ZGV4IGM5Y2ViMTg4NGQuLjE3YTkwMzNiNDMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9pby92c2NzaWlmLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3Zz
Y3NpaWYuaA0KPiBAQCAtMzE1LDYgKzMxNSwzMyBAQCBzdHJ1Y3QgdnNjc2lpZl9yZXNwb25z
ZSB7DQo+ICAgfTsNCj4gICB0eXBlZGVmIHN0cnVjdCB2c2NzaWlmX3Jlc3BvbnNlIHZzY3Np
aWZfcmVzcG9uc2VfdDsNCj4gICANCj4gKy8qIFNDU0kgSS9PIHN0YXR1cyBmcm9tIHZzY3Np
aWZfcmVzcG9uc2UtPnJzbHQgKi8NCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9TVEFU
VVMoeCkgICh4ICYgMHgwMGZmKQ0KPiArDQo+ICsvKiBIb3N0IEkvTyBzdGF0dXMgZnJvbSB2
c2NzaWlmX3Jlc3BvbnNlLT5yc2x0ICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRf
SE9TVCh4KSAgICAoKHVuc2lnbmVkKXggPj4gMTYpDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlG
X1JTTFRfSE9TVF9PSyAgICAgICAgIDANCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9I
T1NUX05PX0NPTk4gICAgMSAvKiBDb3VsZG4ndCBjb25uZWN0IGJlZm9yZSB0aW1lb3V0ICov
DQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9CVVNfQlVTWSAgIDIgLyogQlVT
IGJ1c3kgdGhyb3VnaCB0aW1lb3V0ICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRf
SE9TVF9USU1FX09VVCAgIDMgLyogVElNRUQgT1VUIGZvciBvdGhlciByZWFzb24gKi8NCj4g
KyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0JBRF9UQVJHICAgNCAvKiBCQUQgdGFy
Z2V0ICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9BQk9SVCAgICAgIDUg
LyogQWJvcnQgZm9yIHNvbWUgb3RoZXIgcmVhc29uICovDQo+ICsjZGVmaW5lIFhFTl9WU0NT
SUlGX1JTTFRfSE9TVF9QQVJJVFkgICAgIDYgLyogUGFyaXR5IGVycm9yICovDQo+ICsjZGVm
aW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9FUlJPUiAgICAgIDcgLyogSW50ZXJuYWwgZXJy
b3IgKi8NCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1JFU0VUICAgICAgOCAv
KiBSZXNldCBieSBzb21lYm9keSAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hP
U1RfQkFEX0lOVFIgICA5IC8qIFVuZXhwZWN0ZWQgaW50ZXJydXB0ICovDQo+ICsjZGVmaW5l
IFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9QQVNTVEhSICAgMTAgLyogRm9yY2UgY29tbWFuZCBw
YXN0IG1pZC1sYXllciAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfU09G
VF9FUlIgIDExIC8qIFJldHJ5IHJlcXVlc3RlZCAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJ
Rl9SU0xUX0hPU1RfSU1NX1JFVFIgIDEyIC8qIEhpZGRlbiByZXRyeSByZXF1ZXN0ZWQgKi8N
Cj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1JFUVVFVUUgICAxMyAvKiBSZXF1
ZXVlIGNvbW1hbmQgcmVxdWVzdGVkICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRf
SE9TVF9ESVNSVVBUICAgMTQgLyogVHJhbnNwb3J0IGVycm9yIGRpc3J1cHRlZCBJL08gKi8N
Cj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0ZBSUxGQVNUICAxNSAvKiBUcmFu
c3BvcnQgY2xhc3MgZmFzdGZhaWxlZCAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xU
X0hPU1RfVEFSR19GQUlMIDE2IC8qIFBlcm1hbmVudCB0YXJnZXQgZmFpbHVyZSAqLw0KPiAr
I2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfTkVYX0ZBSUwgIDE3IC8qIFBlcm1hbmVu
dCBuZXh1cyBmYWlsdXJlIG9uIHBhdGggKi8NCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNM
VF9IT1NUX05PTUVNICAgICAxOCAvKiBTcGFjZSBhbGxvY2F0aW9uIGZhaWxlZCAqLw0KPiAr
I2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfTUVEX0VSUiAgIDE5IC8qIE1lZGl1bSBl
cnJvciAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfTUFSR0lOQUwgIDIw
IC8qIFRyYW5zcG9ydCBtYXJnaW5hbCBlcnJvcnMgKi8NCj4gKw0KPiAgIERFRklORV9SSU5H
X1RZUEVTKHZzY3NpaWYsIHN0cnVjdCB2c2NzaWlmX3JlcXVlc3QsIHN0cnVjdCB2c2NzaWlm
X3Jlc3BvbnNlKTsNCj4gICANCj4gICANCg0K
--------------pJSWg1pk9MmnUioD0iwpGi0x
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------pJSWg1pk9MmnUioD0iwpGi0x--

--------------4EwdI0uyC0uPEVXFvmGbvxuy--

--------------08C7iluchGlib5pdNTxrpvBU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIvDWQFAwAAAAAACgkQsN6d1ii/Ey/3
egf/Tp4eNHxUX56EmRFlAOEk94ZgqzgxqTuoOjF6/QQuVKP0BDbgq9NEtctxrAu7XaDjZTR2xhtF
+8+FJCk2Ph29bKE/m5WThXH6i8CzA7GYLUfu/CMoLfzW1J1WAnLCS+v9pRR+ylAlZa+hXg5Bfukg
LmMTHScUsoHIxwMgCu3tbDM0hVqE8h6D3iWgkUsFnJwga3GnrTf7KxzGylKq/V/a1gCGkLsjE5nz
ftfysyzRky87N1+TvAHadynvzgsloSLR+O6riaqJwFJrF1qzISn4O2R9xIvuC06Ia1K8eCdHarv0
XLnC4F4avDKqM/jarNLMEoIkRpGcw8evYkbHQ3OZ4A==
=HsP3
-----END PGP SIGNATURE-----

--------------08C7iluchGlib5pdNTxrpvBU--

