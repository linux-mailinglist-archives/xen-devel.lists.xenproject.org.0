Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2711756A67E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 17:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363016.593326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9T0g-0007Wh-Tx; Thu, 07 Jul 2022 15:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363016.593326; Thu, 07 Jul 2022 15:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9T0g-0007Tv-QH; Thu, 07 Jul 2022 15:01:42 +0000
Received: by outflank-mailman (input) for mailman id 363016;
 Thu, 07 Jul 2022 15:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tn4w=XM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o9T0f-0007Tp-A7
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 15:01:41 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4603b8b-fe05-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 17:01:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 416181FF4D;
 Thu,  7 Jul 2022 15:01:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22EE713461;
 Thu,  7 Jul 2022 15:01:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U/pyBlP1xmKgQAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 07 Jul 2022 15:01:39 +0000
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
X-Inumbo-ID: b4603b8b-fe05-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657206099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sQfCKnsTd55wuOD6eFoikdzBukcpkLFNWRTUM4LtyuA=;
	b=I5DjIg5ln8I4Uno3AYaWUcYw9k2wbw2vzKicYuXgiW233nspN2b+ipk8022J7js/zNNXc+
	IYyYma1LfAKr232/O6A+ibvolff4RUmeZKVBeygcWxtG51ZLpnBxNp8BxdLaBpznfD6KJ/
	H60JbmdAcW0/Y8+xADk0VppuFnWq07A=
Message-ID: <165f61ae-3eae-d595-308a-d60e76cbe130@suse.com>
Date: Thu, 7 Jul 2022 17:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220624092806.27700-1-jgross@suse.com>
 <YsbxkNT+3w/lL9He@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
In-Reply-To: <YsbxkNT+3w/lL9He@perard.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RcadQtd4U5XxXMiWjtI6zlJE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RcadQtd4U5XxXMiWjtI6zlJE
Content-Type: multipart/mixed; boundary="------------i9C7O0haINp8eyBlr3U7e8f0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <165f61ae-3eae-d595-308a-d60e76cbe130@suse.com>
Subject: Re: [PATCH] tools/init-xenstore-domain: fix memory map for PVH
 stubdom
References: <20220624092806.27700-1-jgross@suse.com>
 <YsbxkNT+3w/lL9He@perard.uk.xensource.com>
In-Reply-To: <YsbxkNT+3w/lL9He@perard.uk.xensource.com>

--------------i9C7O0haINp8eyBlr3U7e8f0
Content-Type: multipart/mixed; boundary="------------GqmSHwuyo0ehe0tg8NlRVJrB"

--------------GqmSHwuyo0ehe0tg8NlRVJrB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDcuMjIgMTY6NDUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBGcmksIEp1
biAyNCwgMjAyMiBhdCAxMToyODowNkFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gSW4gY2FzZSBvZiBtYXhtZW0gIT0gbWVtc2l6ZSB0aGUgRTgyMCBtYXAgb2YgdGhlIFBW
SCBzdHViZG9tIGlzIHdyb25nLA0KPj4gYXMgaXQgaXMgbWlzc2luZyB0aGUgUkFNIGFib3Zl
IG1lbXNpemUuDQo+Pg0KPj4gQWRkaXRpb25hbGx5IHRoZSBNTUlPIGFyZWEgc2hvdWxkIG9u
bHkgY292ZXIgdGhlIEhWTSBzcGVjaWFsIHBhZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICB0b29scy9o
ZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMgfCAxNiArKysrKysrKysrLS0tLS0tDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWlu
LmMgYi90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMNCj4+IGluZGV4IGI0
ZjNjNjVhOGEuLmRhZDhlNDNjNDIgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9oZWxwZXJzL2lu
aXQteGVuc3RvcmUtZG9tYWluLmMNCj4+ICsrKyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC14ZW5z
dG9yZS1kb21haW4uYw0KPj4gQEAgLTE1NywyMSArMTU4LDI0IEBAIHN0YXRpYyBpbnQgYnVp
bGQoeGNfaW50ZXJmYWNlICp4Y2gpDQo+PiAgICAgICAgICAgY29uZmlnLmZsYWdzIHw9IFhF
Tl9ET01DVExfQ0RGX2h2bSB8IFhFTl9ET01DVExfQ0RGX2hhcDsNCj4+ICAgICAgICAgICBj
b25maWcuYXJjaC5lbXVsYXRpb25fZmxhZ3MgPSBYRU5fWDg2X0VNVV9MQVBJQzsNCj4+ICAg
ICAgICAgICBkb20tPnRhcmdldF9wYWdlcyA9IG1lbV9zaXplID4+IFhDX1BBR0VfU0hJRlQ7
DQo+PiAtICAgICAgICBkb20tPm1taW9fc2l6ZSA9IEdCKDQpIC0gTEFQSUNfQkFTRV9BRERS
RVNTOw0KPj4gKyAgICAgICAgZG9tLT5tbWlvX3NpemUgPSBYODZfSFZNX05SX1NQRUNJQUxf
UEFHRVMgPDwgWENfUEFHRV9TSElGVDsNCj4+ICAgICAgICAgICBkb20tPmxvd21lbV9lbmQg
PSAobWVtX3NpemUgPiBMQVBJQ19CQVNFX0FERFJFU1MpID8NCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBMQVBJQ19CQVNFX0FERFJFU1MgOiBtZW1fc2l6ZTsNCj4+ICAgICAg
ICAgICBkb20tPmhpZ2htZW1fZW5kID0gKG1lbV9zaXplID4gTEFQSUNfQkFTRV9BRERSRVNT
KSA/DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdCKDQpICsgbWVtX3NpemUg
LSBMQVBJQ19CQVNFX0FERFJFU1MgOiAwOw0KPj4gLSAgICAgICAgZG9tLT5tbWlvX3N0YXJ0
ID0gTEFQSUNfQkFTRV9BRERSRVNTOw0KPj4gKyAgICAgICAgZG9tLT5tbWlvX3N0YXJ0ID0g
KFg4Nl9IVk1fRU5EX1NQRUNJQUxfUkVHSU9OIC0NCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICBYODZfSFZNX05SX1NQRUNJQUxfUEFHRVMpIDw8IFhDX1BBR0VfU0hJRlQ7DQo+
PiAgICAgICAgICAgZG9tLT5tYXhfdmNwdXMgPSAxOw0KPj4gICAgICAgICAgIGU4MjBbMF0u
YWRkciA9IDA7DQo+PiAtICAgICAgICBlODIwWzBdLnNpemUgPSBkb20tPmxvd21lbV9lbmQ7
DQo+PiArICAgICAgICBlODIwWzBdLnNpemUgPSAobWF4X3NpemUgPiBMQVBJQ19CQVNFX0FE
RFJFU1MpID8NCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIExBUElDX0JBU0VfQUREUkVT
UyA6IG1heF9zaXplOw0KPj4gICAgICAgICAgIGU4MjBbMF0udHlwZSA9IEU4MjBfUkFNOw0K
Pj4gLSAgICAgICAgZTgyMFsxXS5hZGRyID0gTEFQSUNfQkFTRV9BRERSRVNTOw0KPj4gKyAg
ICAgICAgZTgyMFsxXS5hZGRyID0gZG9tLT5tbWlvX3N0YXJ0Ow0KPiANCj4gDQo+IFNvLCBp
dCBpc24ndCBleHBlY3RlZCB0byBoYXZlIGFuIGVudHJ5IGNvdmVyaW5nIHRoZSBMQVBJQyBh
ZGRyZXNzZXMsDQo+IHJpZ2h0PyBJIGd1ZXNzIG5vdCBhcyBzZWVuIGluIGRmMWNhMWRmZTIw
Lg0KPiANCj4gQnV0IGJhc2VkIG9uIHRoYXQgc2FtZSBjb21taXQgaW5mbywgc2hvdWxkbid0
IHRoZSBMQVBJQyBhZGRyZXNzIHBhcnQgb2YNCj4gYGRvbS0+bW1pb19zdGFydCwgZG9tLT5t
bWlvX3NpemVgPyAoSSBkb24ndCBrbm93IGhvdyBkb20tPm1taW9fc3RhcnQgaXMNCj4gdXNl
ZCwgeWV0LCBidXQgbWF5YmUgaXQncyB1c2VkIGJ5IFhlbiBvciB4ZW4gbGlicmFyaWVzIHRv
IGF2b2lkDQo+IGFsbG9jYXRpb25zIGluIHRoZSB3cm9uZyBwbGFjZXMpDQoNCkluIG15IHVu
ZGVyc3RhbmRpbmcgdGhpcyBpcyB0aGUgcHVycG9zZSBvZiBsb3dtZW1fZW5kLg0KDQpPVE9I
IEkgY2FuIG1vZGlmeSB0aGUgcGF0Y2ggdG8gYmUgYWxvbmcgdGhlIGxpbmVzIG9mIGRmMWNh
MWRmZTIwLg0KDQoNCkp1ZXJnZW4NCg==
--------------GqmSHwuyo0ehe0tg8NlRVJrB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GqmSHwuyo0ehe0tg8NlRVJrB--

--------------i9C7O0haINp8eyBlr3U7e8f0--

--------------RcadQtd4U5XxXMiWjtI6zlJE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLG9VIFAwAAAAAACgkQsN6d1ii/Ey+P
CQf9GD4PaLhyCe9yoBl0cvI57rg+m55ntFb9xwolybAIJlsgE9oiQJCv0dHxEOOYJ8SirQC81uXi
AdDiLWDUOwHTAD41bjO7nHvLBvqQvBbpQz541c2CjH64IWur2aJV8qBxuH1mVy+9+zlJPROkUk4V
2rNCvPfMTck76Yg9wsEuTtGF72Cw4OfhLdtbqjjr7vMPGx+L9M9WvcTZ28IialJwiLeeQC3o5AGg
iBcx9TtoguBpiEO7tqPSVRnJtP64oXXoPsvY53YOovtLlW9a+vX9SMWODEh+iFFgU5/Kxb7vdhd/
fblkw9Tzy+JldsFEacHoLxPsvg1IcU6Vb+e7th9vTw==
=bhrm
-----END PGP SIGNATURE-----

--------------RcadQtd4U5XxXMiWjtI6zlJE--

