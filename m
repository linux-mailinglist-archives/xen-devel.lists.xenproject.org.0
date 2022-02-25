Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C14C4199
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 10:38:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278935.476363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNX3C-0000Wy-FF; Fri, 25 Feb 2022 09:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278935.476363; Fri, 25 Feb 2022 09:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNX3C-0000Uv-C8; Fri, 25 Feb 2022 09:38:10 +0000
Received: by outflank-mailman (input) for mailman id 278935;
 Fri, 25 Feb 2022 09:38:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNX3A-0000Up-TM
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 09:38:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a348eeac-961e-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 10:38:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B7431F383;
 Fri, 25 Feb 2022 09:38:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C76613B8E;
 Fri, 25 Feb 2022 09:38:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U4KZBX+jGGKMXAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Feb 2022 09:38:07 +0000
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
X-Inumbo-ID: a348eeac-961e-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645781887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iNLXfuS1ukocf3UH1KS7ZzMQvS+SNsfrjBM5tEj5qRA=;
	b=o5biQv3HxM9thzO9cACj+Iuh8Xauas5K7daH4kcO0sYYa3z6tuKffzCUJDDosnLwC2Y9JN
	SDMjhedtqSGV2edEYkFrRJZNTB7iNAVmImpbQRvH+bvZc4F3wLgw4QPuVgGuymti0kkjK9
	L+fj+Ez2si7JUTUqE/9F75SMhex79cM=
Message-ID: <f10818fc-1059-692f-caf3-5fbc1e304855@suse.com>
Date: Fri, 25 Feb 2022 10:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
 <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
 <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
 <bb003355-1a2c-8145-e227-3799f782a099@suse.com>
 <1f848da5-7f02-e380-a616-bff785520a90@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
In-Reply-To: <1f848da5-7f02-e380-a616-bff785520a90@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QpKzCzDVOqB0OkwmxxL2v0bN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QpKzCzDVOqB0OkwmxxL2v0bN
Content-Type: multipart/mixed; boundary="------------ZRkGchB2SOBf7AeKXTDrteLE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <f10818fc-1059-692f-caf3-5fbc1e304855@suse.com>
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
 <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
 <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
 <bb003355-1a2c-8145-e227-3799f782a099@suse.com>
 <1f848da5-7f02-e380-a616-bff785520a90@suse.com>
In-Reply-To: <1f848da5-7f02-e380-a616-bff785520a90@suse.com>

--------------ZRkGchB2SOBf7AeKXTDrteLE
Content-Type: multipart/mixed; boundary="------------WzF0esdaANed5qvi8jCcW0N0"

--------------WzF0esdaANed5qvi8jCcW0N0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDIuMjIgMTA6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wMi4yMDIy
IDA5OjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjUuMDIuMjIgMDk6MzYsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMjQuMDIuMjIgMTc6MTEsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+PiBPbiAyNC4wMi4yMDIyIDExOjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Og0KPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21tLWxvY2tzLmgNCj4+Pj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9tbS1sb2Nrcy5oDQo+Pj4+PiBAQCAtNDIsNyArNDIsNyBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgbW1fbG9ja19pbml0KG1tX2xvY2tfdCAqbCkNCj4+Pj4+ICDC
oCBzdGF0aWMgaW5saW5lIGJvb2wgbW1fbG9ja2VkX2J5X21lKGNvbnN0IG1tX2xvY2tfdCAq
bCkNCj4+Pj4+ICDCoCB7DQo+Pj4+PiAtwqDCoMKgIHJldHVybiAobC0+bG9jay5yZWN1cnNl
X2NwdSA9PSBjdXJyZW50LT5wcm9jZXNzb3IpOw0KPj4+Pj4gK8KgwqDCoCByZXR1cm4gKGwt
PmxvY2suZGF0YS5jcHUgPT0gY3VycmVudC0+cHJvY2Vzc29yKTsNCj4+Pj4+ICDCoCB9DQo+
Pj4+DQo+Pj4+IEkgc2VlIGEgZmFpciByaXNrIHdpdGggdGhpczogQmVoYXZpb3Igd2lsbCBu
b3cgZGlmZmVyIGJldHdlZW4gZGVidWcgYW5kDQo+Pj4+IG5vbi1kZWJ1ZyBidWlsZHMuIEUu
Zy4gYSBsaXZlbG9jayBiZWNhdXNlIG9mIHRyeWluZyB0byBhY3F1aXJlIHRoZSBzYW1lDQo+
Pj4+IGxvY2sgYWdhaW4gd291bGQgbm90IGJlIG5vdGljZWQgaW4gYSBkZWJ1ZyBidWlsZCBp
ZiB0aGUgYWNxdWlyZSBpcw0KPj4+PiBjb25kaXRpb25hbCB1cG9uIHRoaXMgZnVuY3Rpb24n
cyByZXR1cm4gdmFsdWUuIEkgdGhpbmsgdGhpcyBpcyB0aGUgbWFpbg0KPj4+PiByZWFzb24g
YmVoaW5kIGhhdmluZyB0d28gc2VwYXJhdGUgZmllbGQsIGRlc3BpdGUgdGhlIGFwcGFyZW50
IHJlZHVuZGFuY3kuDQo+Pj4NCj4+PiBZb3UgYXJlIGF3YXJlIHRoYXQgbW1fbG9ja2VkX2J5
X21lKCkgaXMgdXNlZCBmb3IgcmVjdXJzaXZlIHNwaW5sb2Nrcw0KPj4+IG9ubHk/DQo+Pg0K
Pj4gQlRXLCBpdCBtaWdodCBtYWtlIHNlbnNlIHRvIGFkZCBhbm90aGVyIGJvb2wgZm9yIHRo
ZSBkZWJ1ZyBjYXNlIHRvIG1hcmsNCj4+IHJlY3Vyc2l2ZSBsb2NrIHVzYWdlLiBJIGRvbid0
IHRoaW5rIGFueXRoaW5nIGdvb2QgY2FuIGNvbWUgZnJvbSB1c2luZyBhDQo+PiBsb2NrIGlu
IGJvdGggbW9kZXMgKHJlY3Vyc2l2ZSBhbmQgbm9uLXJlY3Vyc2l2ZSkuDQo+IA0KPiBCdXQg
YmV3YXJlIG9mIHRoZSBjb2V4aXN0aW5nIHBhZ2luZ19sb2NrKCkgYW5kIHBhZ2luZ19sb2Nr
X3JlY3Vyc2l2ZSgpLg0KPiBBbGJlaXQgSSBndWVzcyB5b3VyIGNvbW1lbnQgd2FzIGZvciBz
cGlubG9ja3MgaW4gZ2VuZXJhbCwgbm90IHRoZQ0KPiBtbS1sb2NrIG1hY2hpbmVyeS4gWWV0
IG1lbnRpb25pbmcgdGhpcyByZW1pbmRzIG1lIG9mIHRoZSBwYWdlIGFsbG9jDQo+IGxvY2ss
IHdoaWNoIGRpZmZlcmVudCBwYXRocyBhY3F1aXJlIGluIGRpZmZlcmVudCB3YXlzLiBTbyB0
aGUgYml0DQo+IGNvdWxkbid0IGJlIGEgc3RpY2t5IG9uZS4NCg0KSW50ZXJlc3RpbmcuDQoN
ClNlZW1zIGFzIGlmIGUuZy4gY29uc29sZV9sb2NrIGlzIHVzZWQgaW4gYm90aCB3YXlzLCB0
b28uDQoNCk1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGF0IGxlYXN0IGFkZCBzb21lIHNlbGYt
ZGVhZGxvY2sgZGV0ZWN0aW9uDQpzdXBwb3J0IHRvIGRlYnVnIGJ1aWxkcy4NCg0KDQpKdWVy
Z2VuDQo=
--------------WzF0esdaANed5qvi8jCcW0N0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WzF0esdaANed5qvi8jCcW0N0--

--------------ZRkGchB2SOBf7AeKXTDrteLE--

--------------QpKzCzDVOqB0OkwmxxL2v0bN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIYo34FAwAAAAAACgkQsN6d1ii/Ey8z
WQf+LeqnIijjdVqRqRYQqlb8H451PgFApo5FNHKqyorQqwckomKVtP/HJi+dSKRz0/yW7qz76Xi2
aZ9yx9KPghc4HaktgT4jLPynrmqNl95Na1wvmmbg7MduJu2L/nUvUK3OXO3SQJcZsWaEm6c3E0Lw
hU6S7ZnZysgLXvGoA24NcE/8uKkFirPTPC+Yw9oYlOKVhbnlRlUax8KZsrBx+fzFjigkQ+0lzy3P
mrQSNGdabx6Om3uP93Jo/PUzHnTPt4K7xYqn59M5qbw+Noz0Eqw85nvFNmzFzaijwTnGKGiCIQi0
60xNnqrV2MLmiim6lZPs+/gQJNWfu+QSMrDY83EYeQ==
=fD1y
-----END PGP SIGNATURE-----

--------------QpKzCzDVOqB0OkwmxxL2v0bN--

