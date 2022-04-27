Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF351122A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 09:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314450.532523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbsQ-0001l2-PX; Wed, 27 Apr 2022 07:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314450.532523; Wed, 27 Apr 2022 07:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbsQ-0001iW-Ll; Wed, 27 Apr 2022 07:14:18 +0000
Received: by outflank-mailman (input) for mailman id 314450;
 Wed, 27 Apr 2022 07:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njbsP-0001i2-Jk
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 07:14:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5d77231-c5f9-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 09:14:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA286210EB;
 Wed, 27 Apr 2022 07:14:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2ABB13A39;
 Wed, 27 Apr 2022 07:14:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZkvsMUftaGIsIgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 27 Apr 2022 07:14:15 +0000
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
X-Inumbo-ID: a5d77231-c5f9-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651043655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SdjsoceP1idfPJtfOz3JxfMbE90qN49iAVy3UNsLWlc=;
	b=j75iKNrB0fsnKUe9dlS16j6EmX9TbtrhdPiqjKV7O8ET/zFDa/E5+v22ht0w02mDUwrQJY
	9W+GxOyQG2LQMiB1rPrbAwP7WBZnvd4vJSAF/iVis0ZOnh2t9b2dUIOGnWeWlCyCA8WrW/
	0u0qNNUC83LRqeHMDiaoi2IjpW7UD6w=
Message-ID: <24f49b4c-9682-d224-7b15-774ee5795350@suse.com>
Date: Wed, 27 Apr 2022 09:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] xen/public: add new macro to ring.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20220427070309.15090-1-jgross@suse.com>
 <f2fe0788-ff74-b5a4-8714-e4eed4d73f14@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f2fe0788-ff74-b5a4-8714-e4eed4d73f14@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CuI8A3qOkSsiuA9owP7fPD0n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CuI8A3qOkSsiuA9owP7fPD0n
Content-Type: multipart/mixed; boundary="------------t9J87nOorznInzZnZp5048Ud";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <24f49b4c-9682-d224-7b15-774ee5795350@suse.com>
Subject: Re: [PATCH v2] xen/public: add new macro to ring.h
References: <20220427070309.15090-1-jgross@suse.com>
 <f2fe0788-ff74-b5a4-8714-e4eed4d73f14@suse.com>
In-Reply-To: <f2fe0788-ff74-b5a4-8714-e4eed4d73f14@suse.com>

--------------t9J87nOorznInzZnZp5048Ud
Content-Type: multipart/mixed; boundary="------------WsOdLrRvG54ey5lshX075Em6"

--------------WsOdLrRvG54ey5lshX075Em6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDQuMjIgMDk6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wNC4yMDIy
IDA5OjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gRm9yIHRoZSBpbml0aWFsaXphdGlv
biBvZiBhIHJpbmcgcGFnZSBieSB0aGUgZnJvbnRlbmQgdHdvIG1hY3JvcyBhcmUNCj4+IGF2
YWlsYWJsZSBpbiByaW5nLmg6IFNIQVJFRF9SSU5HX0lOSVQoKSBhbmQgRlJPTlRfUklOR19J
TklUKCkuDQo+Pg0KPj4gQWxsIGtub3duIHVzZXJzIHVzZSBhbHdheXMgYm90aCBvZiB0aGVt
IGluIGRpcmVjdCBzZXF1ZW5jZS4NCj4+DQo+PiBBZGQgYW5vdGhlciBtYWNybyBYRU5fRlJP
TlRfUklOR19JTklUKCkgY29tYmluaW5nIHRoZSB0d28gbWFjcm9zLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IGFsYmVpdCAuLi4N
Cj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcmluZy5oDQo+PiArKysgYi94
ZW4vaW5jbHVkZS9wdWJsaWMvaW8vcmluZy5oDQo+PiBAQCAtOTUsOSArOTUsOCBAQCB0eXBl
ZGVmIHVuc2lnbmVkIGludCBSSU5HX0lEWDsNCj4+ICAgICogb2YgdGhlIHNoYXJlZCBtZW1v
cnkgYXJlYSAoUEFHRV9TSVpFLCBmb3IgaW5zdGFuY2UpLiBUbyBpbml0aWFsaXNlDQo+PiAg
ICAqIHRoZSBmcm9udCBoYWxmOg0KPj4gICAgKg0KPj4gLSAqICAgICBteXRhZ19mcm9udF9y
aW5nX3QgZnJvbnRfcmluZzsNCj4+IC0gKiAgICAgU0hBUkVEX1JJTkdfSU5JVCgobXl0YWdf
c3JpbmdfdCAqKXNoYXJlZF9wYWdlKTsNCj4+IC0gKiAgICAgRlJPTlRfUklOR19JTklUKCZm
cm9udF9yaW5nLCAobXl0YWdfc3JpbmdfdCAqKXNoYXJlZF9wYWdlLCBQQUdFX1NJWkUpOw0K
Pj4gKyAqICAgICBteXRhZ19mcm9udF9yaW5nX3QgcmluZzsNCj4+ICsgKiAgICAgWEVOX0ZS
T05UX1JJTkdfSU5JVCgmcmluZywgKG15dGFnX3NyaW5nX3QgKilzaGFyZWRfcGFnZSwgUEFH
RV9TSVpFKTsNCj4gDQo+IC4uLiBJIGhhZCBob3BlZCBmb3IgdGhlIG9yaWdpbmFsIHRleHQg
dG8gcmVtYWluIGFuZCB0aGUgbmV3IG1hY3JvDQo+IGJlaW5nIHN1Z2dlc3RlZCBhcyBhIHNo
b3J0aGFuZC4gQnV0IHlvdSdyZSB0aGUgbWFpbnRhaW5lciAuLi4NCg0KSSBwcmVmZXIgdGhl
IHNpbmdsZSBtYWNybywgYXMgaXQgaXMgbGVzcyBjb2RlIGFuZCBoYXMgdGhlIHByb3Blcg0K
bmFtZSBzcGFjZS4NCg0KDQpKdWVyZ2VuDQo=
--------------WsOdLrRvG54ey5lshX075Em6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------WsOdLrRvG54ey5lshX075Em6--

--------------t9J87nOorznInzZnZp5048Ud--

--------------CuI8A3qOkSsiuA9owP7fPD0n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJo7UcFAwAAAAAACgkQsN6d1ii/Ey+q
Lgf9Gyx0CrFsP2ttcQxYJ1YXlATQw4Mg/gr+nJRyQi+BuWCC9r1bttuUXyd65bQez7Zfc5lIzNh7
u4uV2Gs0oXfwlDjrXCBXdptNlD5wuHrGEFW/8SK2tpZe0UJld6tfb+D8+nfGVxVlMa4gdYDD8bNA
FI+tRkkdXMkJQzXwUc/myAp/GSAhv3zymNQd9qwNiuVMEErqXLX7vQ+vgWGkoWrwgaq5ic+e5xjb
S4+nU6NGzld5MrgRODktjZs8vWnuug3+o43/5MjJeqcEKxdVunXAWz/n8nyZSlh++mcY1Q927E2G
1ysSYlnG9YYX1zzJcS4hT8kSkI5Ii0UY+LR62QdSNw==
=fqF4
-----END PGP SIGNATURE-----

--------------CuI8A3qOkSsiuA9owP7fPD0n--

